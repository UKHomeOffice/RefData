import re
from schema_validation import CheckTable as CT


def which_grants(input_file, title):
    """ This function opens the input file, isolates the lines that grant
        access to specific users, and returns grant status as a bool along with
        how many are expected to pass.

        Parameters:
        input_file (str): File path.

        Return:
        grants (dict Bool): Dictionary of granted access.
        G (int): Number of expected grants.
    """
    contents = open(input_file, 'r').readlines()
    grants = {"anonuser": False, "serviceuser": False, "readonlyuser": False}
    G = []
    for line in contents:
        if "GRANT SELECT ON "+title in line:
            G.append(line)
            who = re.search('\$\{(.+?)\}\;', line).group(1)
            if title in line:
                grants[who] = True

    return grants, len(G)

# print(which_grants('MyTest.sql'))
