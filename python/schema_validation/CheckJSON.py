import json
import re

def json_true(json_line):
    """ Checks JSON command is valid and will run.

        Parameters:
        json_line (str):

        Returns:
        Bool: True if line passes.
    """
    try:
        json_object = json.loads(json_line)
    except ValueError:
        return False
    return True

def json_parts(json_line):
    """ Checks for "label" and "description" components of Json command.

        PArameters:
        json_line (str): The Json command being passed into the function.

        Returns:
        Arr [Bool, Bool]: Is there a label command? Is there a description
                          command?
    """
    labF, desF = False, False
    if "\"label\"" in json_line:
        labF = True
    if "\"description\"" in json_line:
        desF = True
    return [labF, desF]

def json_file_read(input_file, title):
    """ Scan .sql file to find all JSON command lines, test json comman is valid
        and report any lines that throw errors.

        Parameters:
        input_file (str): File path.

        Returns:
        Bool: True if all commands run correctly.
        list int: Line index of failed commands
    """
    contents = open(input_file, 'r').readlines()
    reportCmd, reportPrt, error_lines, missL, missD = [], [], [], [], []
    cOut = False
    pOut = False

    for line in contents:
        if title in line:
            if '\'{' in line and '}\'' in line:
                command = re.search('\'{(.+?)}\'', line).group(1)

                Success = json_true('{'+command+'}')
                parts = json_parts(command)

                if Success == True:
                    reportCmd.append(True)
                else:
                    reportCmd.append(False)
                    error_lines.append(contents.index(line)+1)
                if all(reportCmd) == True:
                    cOut = True
                else:
                    cOut = False

                if parts[0] == True:
                    reportPrt.append(True)
                else:
                    reportPrt.append(False)
                    missL.append(contents.index(line)+1)

                if parts[1] == True:
                    reportPrt.append(True)
                else:
                    reportPrt.append(False)
                    missD.append(contents.index(line)+1)

                if all(reportPrt) == True:
                    pOut = True
                else:
                    pOut = False


    return cOut, error_lines, pOut, missL, missD

# print(json_file_read('religion.sql', 'religion'))
