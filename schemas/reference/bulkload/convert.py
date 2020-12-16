#!/usr/bin/env python
import pandas as pd

country_df = pd.read_csv("/Users/molliver/GIT/RefDataBAU/data/schemas/reference/bulkload/country.csv")
address_df = pd.read_csv("/Users/molliver/GIT/private-refdata/reference/bulkload/address.csv")

def getcountry(id):
    cid = country_df.loc[country_df['iso31661alpha2'] == id ]
    if not (cid.empty):
        countryid = round(cid.iloc[0]['id'])
        #print(countryid)
        return countryid
    else:
        #print('missing')
        return None


for id in address_df['iso31661alpha2']:
    if (isinstance(id, str)):
        address_df.loc[(address_df.index[address_df['iso31661alpha2'] == id]), 'countryid'] = getcountry(id)
        #print(address_df.loc[address_df['iso31661alpha2'] == id])


address_df.to_csv(r'/Users/molliver/GIT/RefDataBAU/data/schemas/reference/bulkload/address1.csv', index=False)