CREATE TABLE eventstatus (
  id INT4 NOT NULL PRIMARY KEY,
  status VARCHAR(50),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE eventstatus IS '{"label": "Event status", "description": "A list of event descriptions and statuses.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN eventstatus.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN eventstatus.status IS '{"label": "Status", "description": "Status description for the event.", "businesskey": true, "summaryview": "true"}';
COMMENT ON COLUMN eventstatus.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN eventstatus.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN eventstatus.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON eventstatus TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON eventstatus TO ${serviceuser};
GRANT SELECT ON eventstatus TO ${readonlyuser};
