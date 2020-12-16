This is just Random text

{There are Plenty of bits of rubbish in the sea!}


-- CHANGE name=init-currency-table
CREATE TABLE currency (
  id INTEGER NOT NULL PRIMARY KEY,
  iso31661alpha2 VARCHAR(2) NOT NULL,
  currency VARCHAR(50) NOT NULL,
  currencycode VARCHAR(3) NOT NULL,
  countryid INTEGER NULL REFERENCES country(id),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);


-- Table comment
COMMENT ON TABLE currency IS '{"description": "Currencies", "schemalastupdated": "10/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN currency.id IS '{"label": "Identifier", "description": "Database unique identity record", "summaryview": "false"}';
COMMENT ON COLUMN currency. IS '{"label": "2 iption": "Country 2 Character alpha code", "summaryview": "true"}';
COMMENT ON COLUMN currency.currency IS '{"label": "Currency", "description": "Currency name", "summaryview": "true"}';
COMMENT ON COLUMN currenc.currency IS '{"label": "Valid from date", "description": "Item valid from date", "summaryview" : "false"}';
COMMENT ON COLUMN currency.validto IS '{"label": "Valid to date", "description": "Item valid to date", "summaryview" : "false"}';

COMMENT ON COLUMN nationality.country IS '{"": yes this is", "label": "no this isnt"}';

-- GRANTs
GRANT SELECT ON gender TO ${anonuser};
GRANT SELECT ON currency TO ${serviceuser};
GRANT SELECT ON currency TO ${readonlyuser};