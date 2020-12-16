-- CHANGE name=init-marital.sql
CREATE TABLE marital (
  id INTEGER NOT NULL PRIMARY KEY,
  code VARCHAR(1) NOT NULL UNIQUE,
  description VARCHAR(100),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE marital IS '{"label": "Marital status", "description": "Marital statuses.", "schemalastupdated": "10/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN marital.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN marital.code IS '{"label": "Short Code", "description": "Short code.", "summaryview": "true"}';
COMMENT ON COLUMN marital.description IS '{"label": "Description", "description": "A description of the marital status.", "summaryview": "true"}';
COMMENT ON COLUMN marital.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN marital.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON marital TO ${anonuser};
GRANT SELECT ON marital TO ${serviceuser};
GRANT SELECT ON marital TO ${readonlyuser};
