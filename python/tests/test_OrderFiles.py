""" Test the order files script returns a list of ordered files.
    <james.poulten@viabledata.co.uk>
"""
import OrderFiles as OF

def test_schemaNo():
    assert OF.schemaNo('V10thislist.sql') == 'V10'

def test_find():
    assert OF.findSQL()[0] == ['V34tdareasons.sql', 'V29legtypes.sql',
                               'V30modeoftransport.sql', 'V6gender.sql',
                               'V11religion.sql', 'V31modetypes.sql',
                               'V33tdaapprovalstatus.sql', 'V35unlocode.sql',
                               'V1bootstrap.sql', 'V32targetgroup.sql']

    assert OF.findSQL()[1] == ['./TestSchema/V34tdareasons.sql',
                               './TestSchema/V29legtypes.sql',
                               './TestSchema/V30modeoftransport.sql',
                               './TestSchema/V6gender.sql',
                               './TestSchema/V11religion.sql',
                               './TestSchema/V31modetypes.sql',
                               './TestSchema/V33tdaapprovalstatus.sql',
                               './TestSchema/V35unlocode.sql',
                               './TestSchema/V1bootstrap.sql',
                               './TestSchema/V32targetgroup.sql']

def test_orderFound():
    assert OF.orderSQL(OF.findSQL())[0] == ['V11religion.sql',
                                            'V1bootstrap.sql',
                                            'V29legtypes.sql',
                                            'V30modeoftransport.sql',
                                            'V31modetypes.sql',
                                            'V32targetgroup.sql',
                                            'V33tdaapprovalstatus.sql',
                                            'V34tdareasons.sql',
                                            'V35unlocode.sql', 
                                            'V6gender.sql']

    assert OF.orderSQL(OF.findSQL())[1] == ['./TestSchema/V11religion.sql',
                                        './TestSchema/V1bootstrap.sql',
                                        './TestSchema/V29legtypes.sql',
                                        './TestSchema/V30modeoftransport.sql',
                                        './TestSchema/V31modetypes.sql',
                                        './TestSchema/V32targetgroup.sql',
                                        './TestSchema/V33tdaapprovalstatus.sql',
                                        './TestSchema/V34tdareasons.sql',
                                        './TestSchema/V35unlocode.sql',
                                        './TestSchema/V6gender.sql']
