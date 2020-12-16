CREATE TABLE assaulttypes (
  id INT4 NOT NULL PRIMARY KEY,
  label VARCHAR(15) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE assaulttypes IS '{"label": "Assault types", "description": "Types of assault.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN assaulttypes.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN assaulttypes.label IS '{"label": "Assault", "description": "Description of assault type.", "summaryview": "true"}';
COMMENT ON COLUMN assaulttypes.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN assaulttypes.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON assaulttypes TO ${serviceuser};
GRANT SELECT ON assaulttypes TO ${readonlyuser};