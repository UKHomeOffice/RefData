"""
"""
import CheckTable as CT

def test_find_table_command():
    table = CT.find_table_command('MyTest.sql')
    p1 = 'CREATE TABLE currency (\n  id INTEGER NOT NULL PRIMARY KEY,'
    p2 = '\n  iso31661alpha2 VARCHAR(2) NOT NULL,'
    p3 = '\n  currency VARCHAR(50) NOT NULL,'
    p4 = '\n  currencycode VARCHAR(3) NOT NULL,'
    p5 = '\n  countryid INTEGER NULL REFERENCES country(id),'
    p6 = '\n  validfrom TIMESTAMP WITH TIME ZONE,'
    p7 = '\n  validto TIMESTAMP WITH TIME ZONE'
    p8 = '\n);'
    command = p1+p2+p3+p4+p5+p6+p7+p8
    assert table == command

def test_find_table():
    assert CT.find_table('MyTest.sql')[0] == True
    assert CT.find_table('MyTest2.sql')[1] == 'modeoftransport'

def test_find_columns():
    columns = CT.find_columns('MyTest.sql')[0]
    assert columns == ['id',
                       'iso31661alpha2',
                       'currency',
                       'currencycode',
                       'countryid',
                       'validfrom',
                       'validto']

def test_column_index():
    index1 = CT.column_index('MyTest.sql', 'countryid')
    index2 = CT.column_index('MyTest2.sql', 'validto')
    assert index1 == 12
    assert index2 == 5


def test_check_correct_comments():
    First = CT.check_correct_comments('MyTest.sql')
    Second = CT.check_correct_comments('MyTest2.sql')

    assert First == (False,
                    {'countryid': (False, 'Not Found'),
                     'title': (True, 19),
                     'iso31661alpha2': (False, 'Not Found'),
                     'currencycode': (False, 'Not Found'),
                     'currency': (True, 23),
                     'validto': (True, 25),
                     'validfrom': (False, 'Not Found'),
                     'id': (True, 21)})

    assert Second == (True,
                     {'validto': (True, 14),
                      'validfrom': (True, 13),
                      'type': (True, 12),
                      'id': (True, 11),
                      'title': (True, 9)})
