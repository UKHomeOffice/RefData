CREATE TABLE reasonforforce (
  id INT4 NOT NULL PRIMARY KEY,
  label VARCHAR(35) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE reasonforforce IS '{"label": "Reason for force", "description": "What prompted the requirement of force.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN reasonforforce.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN reasonforforce.label IS '{"label": "Reason", "description": "Description of reason.", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN reasonforforce.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN reasonforforce.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN reasonforforce.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON reasonforforce TO ${serviceuser};
GRANT SELECT ON reasonforforce TO ${readonlyuser};
