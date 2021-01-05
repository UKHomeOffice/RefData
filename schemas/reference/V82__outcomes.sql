CREATE TABLE outcomes (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  nationalsecurity BOOLEAN,
  is81outcome BOOLEAN,
  is91feaoutcome BOOLEAN,
  is91custodianoutcome BOOLEAN,
  remark BOOLEAN,
  nofurtheraction BOOLEAN,
  description VARCHAR(200),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE outcomes IS '{"label": "outcomes", "description": "The outcome of an event.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';

-- Column comments
COMMENT ON COLUMN outcomes.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN outcomes.name IS '{"label": "Name", "description": "A description of the outcome.", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN outcomes.nationalsecurity IS '{"label": "National Security", "description": "Is this outcome related to NS / CT?", "summaryview": "false"}';
COMMENT ON COLUMN outcomes.is81outcome IS '{"label": "IS81 Outcome", "description": "Is this outcome related to an IS81?", "summaryview": "false"}';
COMMENT ON COLUMN outcomes.is91feaoutcome IS '{"label": "IS91 FEA Outcome", "description": "Is this outcome related to an FEA?", "summaryview": "false"}';
COMMENT ON COLUMN outcomes.is91custodianoutcome IS '{"label": "IS91 Custodian Outcome", "description": "Is this outcome related to an IS91?", "summaryview": "false"}';
COMMENT ON COLUMN outcomes.remark IS '{"label": "Remark", "description": "Is this a remark?", "summaryview": "false"}';
COMMENT ON COLUMN outcomes.nofurtheraction IS '{"label": "No Further Action", "description": "Is this an option for no further action", "summaryview": "false"}';
COMMENT ON COLUMN outcomes.description IS '{"label": "Description", "description": "A definition of the outcome.", "summaryview": "true"}';
COMMENT ON COLUMN outcomes.validfrom IS '{"label": "Valid from date", "description": "Item no further valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN outcomes.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN outcomes.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON outcomes TO ${serviceuser};
GRANT SELECT ON outcomes TO ${readonlyuser};
