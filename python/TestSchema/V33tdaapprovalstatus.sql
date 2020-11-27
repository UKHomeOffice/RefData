CREATE TABLE tdaapprovalstatus (
  id INT4 NOT NULL PRIMARY KEY,
  status VARCHAR(80) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE tdaapprovalstatus IS '{"description": "Governance approval status", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN tdaapprovalstatus.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN tdaapprovalstatus.status IS '{"label": "Status", "description": "Governance status of request", "summaryview": "true"}';
COMMENT ON COLUMN tdaapprovalstatus.validfrom IS '{"label": "Valid from date", "description": "Item valid from date", "summaryview" : "false"}';
COMMENT ON COLUMN tdaapprovalstatus.validto IS '{"label": "Valid to date", "description": "Item valid to date", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON tdaapprovalstatus TO ${anonuser};
GRANT SELECT ON tdaapprovalstatus TO ${serviceuser};
GRANT SELECT ON tdaapprovalstatus TO ${readonlyuser};
