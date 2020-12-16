-- CHANGE name=init-nationality-table
CREATE TABLE nationality (
  id INTEGER NOT NULL PRIMARY KEY,
  nationality VARCHAR(50) NOT NULL,
  description VARCHAR(350) NULL,
  iso31661alpha3 VARCHAR(3) NULL,
  iso31661alpha2 VARCHAR(2) NULL,
  visarequired BOOLEAN NOT NULL,
  evwoptional BOOLEAN NOT NULL,
  diplomaticexception BOOLEAN NOT NULL,
  specialexception BOOLEAN NOT NULL,
  countryid INTEGER NULL REFERENCES country(id),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);


-- Table comment
COMMENT ON TABLE nationality IS '{"label": "Nationalities", "description": "A list of global nationalities.", "schemalastupdated": "10/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN nationality.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN nationality.nationality IS '{"label": "Nationality", "description": "The name of the nationality.", "summaryview": "true"}';
COMMENT ON COLUMN nationality.description IS '{"label": "Description", "description": "Descriptions nationality.", "summaryview": "true"}';
COMMENT ON COLUMN nationality.iso31661alpha3 IS '{"label": "3 digit alpha code", "description": "The countries 3 Character alpha code.", "summaryview": "true"}';
COMMENT ON COLUMN nationality.iso31661alpha2 IS '{"label": "2 digit alpha code", "description": "The countries 2 Character alpha code.", "summaryview": "true"}';
COMMENT ON COLUMN nationality.visarequired IS '{"label": "Visa required", "description": "Is VISA required to visit UK?", "summaryview": "false"}';
COMMENT ON COLUMN nationality.evwoptional IS '{"label": "Optional - EVW", "description": "Is Electronic Visa Waver optional to visit UK?", "summaryview": "false"}';
COMMENT ON COLUMN nationality.diplomaticexception IS '{"label": "Exception - Diplomatic", "description": "Are there diplomatic exceptions for visiting the UK?", "summaryview": "false"}';
COMMENT ON COLUMN nationality.specialexception IS '{"label": "Exception - Special", "description": "Are there special exceptions for visiting the UK?", "summaryview": "false"}';
COMMENT ON COLUMN nationality.countryid IS '{"label": "Linked country id", "description": "The countries link to the Country dataset.", "summaryview": "false"}';
COMMENT ON COLUMN nationality.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN nationality.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON nationality TO ${anonuser};
GRANT SELECT ON nationality TO ${serviceuser};
GRANT SELECT ON nationality TO ${readonlyuser};
