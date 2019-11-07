-- CHANGE name=init-currency-table
CREATE TABLE currency (
  id INTEGER NOT NULL PRIMARY KEY,
  currency VARCHAR(50) NOT NULL,
  currencycode VARCHAR(3) NOT NULL,
  countryid integer[],
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);


-- Table comment
COMMENT ON TABLE currency IS '{"label": "Currencies", "description": "A list of global currencies.", "schemalastupdated": "06/11/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN currency.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN currency.currency IS '{"label": "Currency", "description": "The name of the currency.", "summaryview": "true"}';
COMMENT ON COLUMN currency.currencycode IS '{"label": "Code", "description": "The code associated with the currency.", "summaryview": "true"}';
COMMENT ON COLUMN currency.countryid IS '{"label": "Linked country id", "description": "The countries link to the Country dataset.", "summaryview": "false"}';
COMMENT ON COLUMN currency.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN currency.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON currency TO ${anonuser};
GRANT SELECT ON currency TO ${serviceuser};
GRANT SELECT ON currency TO ${readonlyuser};
