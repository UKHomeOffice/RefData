CREATE TABLE bordercrossingmode (
  id INT4 NOT NULL PRIMARY KEY,
  border VARCHAR(5) NOT NULL,
  type VARCHAR(10) NOT NULL,
  personorfreight VARCHAR(7) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE bordercrossingmode IS '{"label": "Type of Border Crossing", "description": "Methods of crossing the border", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN bordercrossingmode.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN bordercrossingmode.border IS '{"label": "Border", "description": "Type of border", "summaryview": "true"}';
COMMENT ON COLUMN bordercrossingmode.type IS '{"label": "Service type", "description": "Is the service commercial or general", "summaryview": "true"}';
COMMENT ON COLUMN bordercrossingmode.personorfreight IS '{"label": "Person or Freight", "description": "Is it a person or freight crossing the border", "summaryview": "true"}';
COMMENT ON COLUMN bordercrossingmode.validfrom IS '{"label": "Valid from date", "description": "Item valid from date", "summaryview" : "false"}';
COMMENT ON COLUMN bordercrossingmode.validto IS '{"label": "Valid to date", "description": "Item valid to date", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON bordercrossingmode TO ${anonuser};
GRANT SELECT ON bordercrossingmode TO ${serviceuser};
GRANT SELECT ON bordercrossingmode TO ${readonlyuser};
