"""
    Packages required
    terminaltables
    colorclass
"""
from schema_validation import CheckGrants as CG
from schema_validation import CheckJSON  as CJ
from schema_validation import CheckTable as CT
from schema_validation import OrderFiles as OF
import os
import re
from terminaltables import SingleTable, AsciiTable
from colorclass import Color

def test_schema():
    exclusions = os.getenv('EXCLUSION_LIST', '["V1__bootstrap.sql"]')
    exclusions = exclusions.split(',')
    for item in exclusions:
        i = re.search('\[\"(.+?)\"\]', item).group(1)
        exclusions[exclusions.index(item)] = i

    file_list, file_path = OF.findSQL()
    file_list, file_path = OF.orderSQL(file_list, file_path)

    for ex in exclusions:
        if ex in file_list:
            i = file_list.index(ex)
            file_list.pop(i)
            file_path.pop(i)

    table_data = [[Color('{autogreen}File Name{/autogreen}'),
                   'Create Table',
                   'Comments',
                   'Valid JSON',
                   'Grants',
                   Color('{red}Errors{/red}')]]


    Pass_Total, Errors_Total, Flags_Total = 0, 0, 0
    ErrorFile, FlagFile = [], []


    for i in range(len(file_list)):
        print(file_list[i])
        Pass = True
        filePath = file_path[i]
        Schema = CT.find_table(filePath)

        T = ''
        JSONcommands = ''
        Grants = ''
        Errors = ''

        if Schema[0] == True:
            for title in Schema[1]:
                T = '{green}Pass{/green}'

                columns = CT.find_columns(filePath, title)
                comments = CT.check_correct_comments(filePath, title)
                if comments[0] == True:
                    Com = '{green}Pass{/green}'
                if comments[0] == False:
                    Pass = False
                    Errors_Total +=1
                    if file_list[i] not in ErrorFile:
                        ErrorFile.append(file_list[i])

                    Com = '{red}Fail{/red}\n'
                    Err = '{red}Comments missing{/red}'
                    for key in comments[1].keys():
                        if comments[1][key][0] == False:
                            Com += str(key)+'\n'
                    Errors += Err + '\n'


                J = CJ.json_file_read(filePath, title)
                if J[0] == True:
                    if J[2] == True:
                        JSONcommands = '{green}Pass{/green}'
                if J[0] == False:
                    Pass = False
                    Errors_Total +=1
                    if file_list[i] not in ErrorFile:
                        ErrorFile.append(file_list[i])

                    JSONcommands = '{red}Fail:{/red}\n'
                    Err = '{red}JSON Error line(s){/red}'
                    for e in J[1]:
                        JSONcommands += str(e)+'\n'
                    Errors += Err + '\n'

                if J[2] == False:
                    Pass = False
                    Flags_Total += 1
                    FlagFile.append(file_list[i])
                    Err = '{yellow}Missing infomation{/yellow}'
                    JSONcommands += '{yellow}Warning:{/yellow}\n'

                    if len(J[3]) != 0:
                        JSONcommands += 'Missing label(s)\n'
                        for e in J[3]:
                            JSONcommands += str(e)+'\n'
                    if len(J[4]) !=0:
                        JSONcommands += 'Missing description(s)\n'
                        for e in J[4]:
                            JSONcommands += str(e)+'\n'



                G = CG.which_grants(filePath, title)
                if sum((v == True for v in G[0].values())) != G[1]:
                    Pass = False

                    Errors_Total +=1
                    if file_list[i] not in ErrorFile:
                        ErrorFile.append(file_list[i])

                    Gpass = False
                    Grants = '{red}Fail{/red}\n'
                    Err = '{red}Access Expected{/red}\n'
                    for key in G[0].keys():
                        if G[0][key] == False:
                            Grants += '{blue}'+str(key)+'{/blue}\n'
                        if G[0][key] == True:
                            Grants += '{green}'+str(key)+'{/green}\n'
                    Errors += Err + '\n'
                else:
                    Gpass = True
                    Grants = '{green}Pass{/green}'


            if Schema[0] == False:
                T, Com, JSONcommands, Grants, Errors = '---', '---', '---', '---', '---'
                Pass = False
                Flags_Total += 1
                FlagFile.append(file_list[i])



            if Pass == False:
                table_data.append([file_list[i],
                                   Color(T),
                                   Color(Com),
                                   Color(JSONcommands),
                                   Color(Grants),
                                   Color(Errors)])
            else:
                Pass_Total +=1

    table_style = os.environ.get('TABLE_STYLE')
    if table_style is None:
       table_style = 'ascii'

    reportTable = None
    if table_style == 'ascii':
         reportTable = AsciiTable(table_data)
    else:
         reportTable = SingleTable(table_data)

    reportTable.inner_row_border = True
    reportTable.justify_columns = {0: 'center',
                                   1: 'center',
                                   2: 'center',
                                   3: 'center',
                                   4: 'center',
                                   5: 'center'}

    Passes = '{green}Files Passed: '+str(Pass_Total)+ '{/green}'
    Err = '{red}Errors Found: ' + str(Errors_Total) + '{/red}'
    Flags = '{yellow}Flags Found: ' + str(Flags_Total) + '{/yellow}'
    EF = ''
    FF = ''
    for f in ErrorFile:
        if len(EF) == 0:
            EF += str(f)
        else:
            EF += '\n'+str(f)
    ## Option to add a "Flags found" row to the report table,
    for f in FlagFile:
        if len(FF) == 0:
            FF += str(f)
        else:
            FF += '\n'+str(f)


    table_instance = None
    if table_style == 'ascii':
         table_instance = AsciiTable([[Color(Passes), ''],
                                  [Color(Err), EF],
                                  [Color(Flags), FF]],
                                 ' Formatting Summary ')
    else:
         table_instance = SingleTable([[Color(Passes), ''],
                                  [Color(Err), EF],
                                  [Color(Flags), FF]],
                                 ' Formatting Summary ')

    table_instance.inner_row_border = True

    print(reportTable.table)
    print(table_instance.table)

    if Errors_Total != 0:
       print('Schema validation failed')
       exit(1)
