CREATE TABLE lockuptype (
  id INT4 NOT NULL PRIMARY KEY,
  code VARCHAR(6) NOT NULL,
  name VARCHAR(40),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE lockuptype IS '{"label": "Types of lockup", "description": "Types of lockup and associated codes.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN lockuptype.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN lockuptype.name IS '{"label": "Name", "description": "Class of lockup.", "businesskey": true, "summaryview": "true"}';
COMMENT ON COLUMN lockuptype.code IS '{"label": "Code", "description": "Lockup code.", "summaryview": "true"}';
COMMENT ON COLUMN lockuptype.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN lockuptype.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN lockuptype.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON lockuptype TO ${serviceuser};
GRANT SELECT ON lockuptype TO ${readonlyuser};
