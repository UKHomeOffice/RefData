import CheckGrants as CG

def test_which_grants():
    which = CG.which_grants('MyTest.sql')
    G = ({'readonlyuser': True, 'serviceuser': True, 'anonuser': False}, 3)
    assert which == G
