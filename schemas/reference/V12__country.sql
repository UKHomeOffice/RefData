-- CHANGE name=init-country-table
CREATE TABLE country (
  id integer primary key,
  iso31661alpha2 CHARACTER VARYING(2) NOT NULL,
  iso31661alpha3 CHARACTER VARYING(3) NOT NULL,
  name CHARACTER VARYING(40) NOT NULL,
  continent CHARACTER VARYING(2) NOT NULL,
  dial CHARACTER VARYING(20),
  iso31661numeric INTEGER NOT NULL,
  validfrom date,
  validto date
);

COMMENT ON TABLE country IS '{"description": "Countries", "schemalastupdated": "10/03/2019", "dataversion": 1}';
COMMENT ON COLUMN country.id IS '{"label": "Identifier", "description": "database unique identity record", "summaryview": "false"}';
COMMENT ON COLUMN country.name IS '{"label": "Country name", "description": "Country name", "summaryview": "true"}';
COMMENT ON COLUMN country.iso31661alpha2 IS '{"label": "2 digit alpha code", "description": "Country 2 Character alpha code", "summaryview": "true"}';
COMMENT ON COLUMN country.iso31661alpha3 IS '{"label": "3 digit alpha code", "description": "Country 3 Character alpha code", "summaryview": "true"}';
COMMENT ON COLUMN country.continent IS '{"label": "Continent", "description": "Countinent country is part of", "summaryview": "true"}';
COMMENT ON COLUMN country.dial IS '{"label": "Phone dial code", "description": "Country dialing prefix", "summaryview": "true"}';
COMMENT ON COLUMN country.iso31661numeric IS '{"label": "3 digit numeric code", "description": "Country numeric ISO code", "summaryview": "true"}';
COMMENT ON COLUMN country.validfrom IS '{"label": "Valid from date", "description": "Item valid from date", "summaryview" : "false"}';
COMMENT ON COLUMN country.validto IS '{"label": "Valid to date", "description": "Item valid to date", "summaryview" : "false"}';


-- GRANTs
GRANT SELECT ON country TO ${anonuser};
GRANT SELECT ON country TO ${serviceuser};
GRANT SELECT ON country TO ${readonlyuser};
