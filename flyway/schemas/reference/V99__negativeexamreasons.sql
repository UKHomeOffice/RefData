CREATE TABLE negativeexamreasons (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(100),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE negativeexamreasons IS '{"label": "Reason the exam outcome was negative", "description": "List of possible reasons the exam outcome was negative", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN negativeexamreasons.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN negativeexamreasons.name IS '{"label": "Reason for negative", "description": "List of possible reasons the exam outcome was negative", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN negativeexamreasons.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN negativeexamreasons.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN negativeexamreasons.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON negativeexamreasons TO ${serviceuser};
GRANT SELECT ON negativeexamreasons TO ${readonlyuser};
