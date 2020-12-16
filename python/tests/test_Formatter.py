import FormCheck as FC

def test_name_1():
    file = 'TestSchema/V31modetypes.sql'
    assert FC.table_name(file) == 'modetypes'

def test_name_2():
    file = 'TestSchema/V1bootstrap.sql'
    assert FC.table_name(file) == 'Table not created, no title found.'
