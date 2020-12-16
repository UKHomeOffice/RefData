CREATE TABLE tdareasons (
  id INT4 NOT NULL PRIMARY KEY,
  reason VARCHAR(80) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE tdareasons IS '{"label": "Reasons for governance request", "description": "Reasons for presenting to the Technical Design Authority.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN tdareasons.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN tdareasons.reason IS '{"label": "Reason", "description": "The reason for the request.", "summaryview": "true"}';
COMMENT ON COLUMN tdareasons.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN tdareasons.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON tdareasons TO ${anonuser};
GRANT SELECT ON tdareasons TO ${serviceuser};
GRANT SELECT ON tdareasons TO ${readonlyuser};
