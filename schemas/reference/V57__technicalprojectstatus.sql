CREATE TABLE technicalprojectstatus (
  id INT4 NOT NULL PRIMARY KEY,
  status VARCHAR(20) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE technicalprojectstatus IS '{"label": "Technical project status", "description": "A list of statuses that may be assigned to a technical project.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN technicalprojectstatus.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN technicalprojectstatus.status IS '{"label": "Status", "description": "The status of the project.", "summaryview": "true"}';
COMMENT ON COLUMN technicalprojectstatus.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN technicalprojectstatus.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON technicalprojectstatus TO ${anonuser};
GRANT SELECT ON technicalprojectstatus TO ${serviceuser};
GRANT SELECT ON technicalprojectstatus TO ${readonlyuser};
