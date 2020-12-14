CREATE TABLE tdaapprovalstatus (
  id INT4 NOT NULL PRIMARY KEY,
  status VARCHAR(80) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE tdaapprovalstatus IS '{"label": "Governance approval", "description": "A list detailing the Technical Design Authority approval status.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN tdaapprovalstatus.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN tdaapprovalstatus.status IS '{"label": "Status", "businesskey": "true", "description": "Outcomes set by the Technical Design Authority.", "summaryview": "true"}';
COMMENT ON COLUMN tdaapprovalstatus.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN tdaapprovalstatus.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN ministry.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON tdaapprovalstatus TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON tdaapprovalstatus TO ${serviceuser};
GRANT SELECT ON tdaapprovalstatus TO ${readonlyuser};
