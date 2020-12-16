CREATE TABLE damagemethod (
  id INT4 NOT NULL PRIMARY KEY,
  description VARCHAR(60) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE damagemethod IS '{"label": "Damage methods", "description": "Methods of damage used to gain entry.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN damagemethod.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN damagemethod.description IS '{"label": "Method", "description": "The type of the entry method.", "summaryview": "true"}';
COMMENT ON COLUMN damagemethod.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN damagemethod.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON damagemethod TO ${serviceuser};
GRANT SELECT ON damagemethod TO ${readonlyuser};