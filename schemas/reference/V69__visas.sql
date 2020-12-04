CREATE TABLE visas (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(60) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE visas IS '{"label": "Types of visas", "description": "A list of different types of visas for entry to the UK.", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN visas.id IS '{"label": "Identifier", "businesskey": true, "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN visas.name IS '{"label": "Name", "description": "The type of visa.", "summaryview": "true"}';
COMMENT ON COLUMN visas.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN visas.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN visas.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON visas TO ${serviceuser};
GRANT SELECT ON visas TO ${readonlyuser};
