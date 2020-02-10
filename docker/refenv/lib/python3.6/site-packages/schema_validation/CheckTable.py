import re


def find_table_command(input_file):
    """ Returns all 'CREATE TABLE' command from the .sql files.

        Parameters:
        input_file (str): file path.

        Returns:
        Arr[str]: ['CREATE TABLE *name* ( *** table creation ***);', ...]
    """
    contents = open(input_file, 'r')
    file = "".join(contents)
    table_title = find_table(input_file)[1]
    table_command =[]
    for title in table_title:
        stString = 'CREATE TABLE '+str(title)+ ' ('
        start = file.find(stString)
        end = file.find(');', start)
        word_list = file[start+len(stString):end].split(',')
        table_command.append(stString+ ','.join(word_list)+');')

    return table_command


def find_table(input_file):
    """ Finds the table name, as defined in the 'CREATE TABLE' command found in
        the .sql file.

        Parameters:
        input_file (str): File path.

        Returns:
        Bool: True if title found.
        str: Title
    """
    contents = open(input_file, 'r').readlines()
    title = []
    for line in contents:
        if 'CREATE TABLE' in line:
            T = re.search('CREATE TABLE (.+?) \(',line).group(1).strip('\"')
            title.append(T)
    if len(title) != 0:
        return True, title
    else:
        return False, title


def find_columns(input_file, title):
    """ Returns the column names and the command lines that gouverns their
        creation.

        Parameters:
        input_file (str): File path.

        Returns:
        list str: Column names
        list str: Column creation commands
    """
    contents = find_table_command(input_file)
    for command in contents:
        if ' '+title+' ' in command:
            command = command.split('\n')
            command.pop(0)
            command.pop(-1)
            column = []
            for line in command:
                column.append(line.split()[0].strip('\"'))
    return column, command


def column_index(input_file, name):
    """ Returns the line index of column creation command.

        Parameters:
        input_file (str): File path.
        name (str): Column name.

        Returns:
        int: Line index of column creation command.
    """
    col, com = find_columns(input_file)
    col_name = name
    contents = open(input_file, 'r').readlines()
    for line in contents:
        if com[col.index(col_name)] in line:
            line_index = contents.index(line)+1
    return line_index


def check_correct_comments(input_file, title):
    """ This function uses the column names found via the find_column function
        to generate a report of the column comments found in the schema.

        Parameters:
        input_file (str): File path.

        Return:
        Bool: True if all expected comments are found.
        Dict: Working comments and line inxed.
    """
    contents = open(input_file, 'r').readlines()
    col_names = find_columns(input_file, title)[0]
    working = False
    Report = {}
    found = []
    title_comments = []
    for line in contents:
        i = contents.index(line)+1

        if 'COMMENT ON TABLE ' in line:
            title_comments.append(line)

        if 'COMMENT ON COLUMN ' in line:
            if line[-2] == ';':
                for name in col_names:
                    cmt_cmd = 'COMMENT ON COLUMN '+str(title)+'.'+str(name)+' IS'

                    if cmt_cmd in line and name not in found:
                        found.append(name)
                        col_names.pop(col_names.index(name))
                        Report[str(name)] = True, i

    Report['Tab_title'] = False, 'NotFound'
    for commands in title_comments:
        i = contents.index(commands)+1
        if ('COMMENT ON TABLE '+str(title)+' IS' in commands) == True:
            Report['Tab_title'] = True, i

    for name in col_names:
        Report[str(name)] = False, 'Not Found'
    if all(v[0] == True for v in Report.values()) == True:
        total = (len(find_columns(input_file, title)[0])+1)
        if sum(v[0] == True for v in Report.values()) == total:
            working = True
    return working, Report

# print(check_correct_comments('Ref/V7__sex.sql', 'sex'))
