import CheckJSON as CJ

def test_json_true():
    command = '{"label": "Valid to date", "description": "Item valid to date"}'
    assert CJ.json_true('asdn a cioaern: , aekm: sodirj') == False
    assert CJ.json_true(command) == True

def test_json_file_read():
    assert CJ.json_file_read('MyTest.sql') == (False, [27, 32])
