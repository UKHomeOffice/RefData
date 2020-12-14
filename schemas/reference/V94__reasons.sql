CREATE TABLE reasons (
  id INT4 NOT NULL PRIMARY KEY,
  reasoncode VARCHAR(10),
  reason VARCHAR(100) NOT NULL,
  subreason BOOLEAN,
  document BOOLEAN,
  vehicle BOOLEAN,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE reasons IS '{"label": "Reasons behind seizure", "description": "Summary list of reasons for a seizure.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN reasons.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN reasons.reasoncode IS '{"label": "Reason code", "businesskey": "true", "description": "Code identifying the reason for seizure.", "summaryview": "false"}';
COMMENT ON COLUMN reasons.reason IS '{"label": "Description", "description": "The reason for the seizure.", "businesskey": "true", "summaryview": "false"}';
COMMENT ON COLUMN reasons.subreason IS '{"label": "Subform", "description": "To indicate whether this is a subcategory of a higher level reason.", "summaryview": "false"}';
COMMENT ON COLUMN reasons.document IS '{"label": "Document", "description": "To indicate whether this reason is linked to a document seizure.", "summaryview": "false"}';
COMMENT ON COLUMN reasons.vehicle IS '{"label": "Vehicle", "description": "To indicate whether this reason is linked to a vehicle seizure.", "summaryview": "false"}';
COMMENT ON COLUMN reasons.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN reasons.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN reasons.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON reasons TO ${serviceuser};
GRANT SELECT ON reasons TO ${readonlyuser};
