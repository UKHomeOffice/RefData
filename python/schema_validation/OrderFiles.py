import os
import re

workdir = os.environ.get('WORKDIR')
if workdir is None:
    workdir = '.'

os.chdir(workdir)

def schemaNo(x):
    """ Returns the first 3 characters of a string.

        Parameters:
        x (str): file name string.

        Return:
        str: first 3 characters.
    """
    return(x[0:3])


def findSQL():
    """ Walk through all folders and files in current directory, searching for
        all .sql files and appending them to a list.

        Parameters:
        Na

        Returns:
        list (str): Unordered list of file names.
        list (str): Unordered list of file paths.
    """
    filePath, fileList = [], []
    for root, dirs, files in os.walk("."):
        print(dirs)
        for file in files:
            if file.endswith('.sql'):
                filePath.append(os.path.join(root, file))
                fileList.append(file)
    fileList = fileList
    return fileList, filePath


def orderSQL(list, path):
    """ Orders the .sql files found by the findSQL function.

        Parameters:
        list (str): Unordered list of file names
        list (str): Unordered list of file paths

        Returns:
        list (str): Ordered list of file names.
        list (str): Ordered list of file paths.
    """
    orderPath = []
    orderList = sorted(list, key = schemaNo)
    for file in orderList:
        for dir in path:
            if file in dir:
                orderPath.append(dir)
    return orderList, orderPath
