-- CHANGE name=init-country-table
CREATE TABLE country (
  id integer primary key,
  iso31661alpha2 VARCHAR(2) NOT NULL,
  iso31661alpha3 VARCHAR(3) NOT NULL,
  name VARCHAR(50) NOT NULL,
  continent VARCHAR(2) NOT NULL,
  dial VARCHAR(20),
  iso31661numeric INTEGER NOT NULL,
  wicucode INTEGER NOT NULL,
  unm49code INTEGER NOT NULL,
  sovereignfcorecognisedstate BOOLEAN NULL,
  linkedcountryiso3code VARCHAR(3),
  relationshipwithlinkedcountry VARCHAR (90),
  fullname VARCHAR (80),
  un BOOLEAN NOT NULL,
  nato BOOLEAN NOT NULL,
  interpolcode INTEGER NULL,
  visaregime VARCHAR(10),
  commonwealth BOOLEAN NOT NULL,
  eu BOOLEAN NOT NULL,
  eea BOOLEAN NOT NULL,
  euoutermost BOOLEAN NOT NULL,
  euoverseasassociation BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE country IS '{"label": "Countries", "description": "A list of territories, geographic areas and countries recognised by the Foreign and Commonwealth Office.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN country.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN country.name IS '{"label": "Country name", "description": "The name of the country, territory or geographic area.", "businesskey": true, "summaryview": "true"}';
COMMENT ON COLUMN country.iso31661alpha2 IS '{"label": "2 digit alpha code", "description": "The country/territory/geographic areas 2 character alpha code.", "summaryview": "true"}';
COMMENT ON COLUMN country.iso31661alpha3 IS '{"label": "3 digit alpha code", "businesskey": true, "description": "The country/territory/geographic areas 3 character alpha code.", "summaryview": "true"}';
COMMENT ON COLUMN country.continent IS '{"label": "Continent", "description": "The continent the country/territory/geographic areas is part of.", "summaryview": "true"}';
COMMENT ON COLUMN country.dial IS '{"label": "Phone dial code", "description": "The country/territory/geographic areas dialing prefix.", "summaryview": "true"}';
COMMENT ON COLUMN country.iso31661numeric IS '{"label": "3 digit numeric code", "description": "The country/territory/geographic areas numeric ISO code.", "summaryview": "true"}';
COMMENT ON COLUMN country.wicucode IS '{"label": "WICU code", "description": "WICU code of the country/territory/geographic area.", "summaryview": "false"}';
COMMENT ON COLUMN country.unm49code IS '{"label": "UN M49 code", "description": "UN M49 code of the country/territory/geographic area.", "summaryview": "false"}';
COMMENT ON COLUMN country.sovereignfcorecognisedstate IS '{"label": "Soverign State", "description": "Is this state recognised by the Foreign and Commonwealth Office as Sovereign.", "summaryview": "false"}';
COMMENT ON COLUMN country.linkedcountryiso3code IS '{"label": "Linked Country", "description": "If the state is not recognised by the Foreign and Commonwealth Office as Sovereign, then this Country handles its International Relations.", "summaryview": "TRUE"}';
COMMENT ON COLUMN country.relationshipwithlinkedcountry IS '{"label": "Relationship with linked Country", "description": "Relationship with another country, if there is one.", "summaryview": "TRUE"}';
COMMENT ON COLUMN country.fullname IS '{"label": "Full Name", "description": "The full name of the country/territory/geographic area.", "summaryview": "false"}';
COMMENT ON COLUMN country.un IS '{"label": "United Nations membership", "description": "Is this country/territory/geographic area a member of the United Nations.", "summaryview": "false"}';
COMMENT ON COLUMN country.nato IS '{"label": "NATO membership", "description": "Is this country/territory/geographic area a member of the North Atlantic Treaty Organisation.", "summaryview": "false"}';
COMMENT ON COLUMN country.interpolcode IS '{"label": "Interpol Code", "description": "The Interpol code of the country/territory/geographic area.", "summaryview": "false"}';
COMMENT ON COLUMN country.visaregime IS '{"label": "Visa Regime", "description": "The Visa regime of the country/territory/geographic area.", "summaryview": "false"}';
COMMENT ON COLUMN country.commonwealth IS '{"label": "Commonwealth membership", "description": "Is this country/territory/geographic area a member of the Commonwealth.", "summaryview": "false"}';
COMMENT ON COLUMN country.eu IS '{"label": "EU membership", "description": "Is this country/territory/geographic area a member of the European Union.", "summaryview": "false"}';
COMMENT ON COLUMN country.eea IS '{"label": "EEA membership", "description": "Is this country/territory/geographic area a member of the European Ecconomic Area.", "summaryview": "false"}';
COMMENT ON COLUMN country.euoutermost IS '{"label": "EU Outermost Regions", "description": "Is this country/territory/geographic area one of the European Unions Outermost Regions.", "summaryview": "false"}';
COMMENT ON COLUMN country.euoverseasassociation IS '{"label": "EU Overseas Association", "description": "Is this country/territory/geographic area a member of the EUs OVerseas Association.", "summaryview": "false"}';
COMMENT ON COLUMN country.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN country.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN country.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON country TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON country TO ${serviceuser};
GRANT SELECT ON country TO ${readonlyuser};
