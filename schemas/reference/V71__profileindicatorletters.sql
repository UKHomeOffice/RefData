CREATE TABLE profileindicatorletters (
  id VARCHAR(1) NOT NULL PRIMARY KEY,
  description VARCHAR(60) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE profileindicatorletters IS '{"label": "Profile indicator letters", "description": "A list of different types of profile indicator letter codes.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN profileindicatorletters.id IS '{"label": "Letter code", "description": "Profile indicator lettter code - Unique identifying column.", "summaryview": "true"}';
COMMENT ON COLUMN profileindicatorletters.description IS '{"label": "Description", "description": "Description of the profile indicator letter codes use.", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN profileindicatorletters.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN profileindicatorletters.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN profileindicatorletters.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON profileindicatorletters TO ${serviceuser};
GRANT SELECT ON profileindicatorletters TO ${readonlyuser};
