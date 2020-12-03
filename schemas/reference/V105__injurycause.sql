CREATE TABLE injurycause (
  id INTEGER NOT NULL PRIMARY KEY,
  injurycause VARCHAR(55) NOT NULL,
  description VARCHAR(100),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE injurycause IS '{"label": "Injury Type", "description": "Different types of Injury.", "schemalastupdated": "17/04/2020", "dataversion": 1}';
-- Column comment
COMMENT ON COLUMN injurycause.id IS '{"label": "Identifier", "businesskey": true, "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN injurycause.injurycause IS '{"label": "Cause of injury", "description": "Common causes of workplace injuries and accidents.", "summaryview": "true"}';
COMMENT ON COLUMN injurycause.description IS '{"label": "Description", "description": "Description of the cause of injury.", "summaryview": "true"}';
COMMENT ON COLUMN injurycause.validfrom IS '{"label": "Valid from date", "description": "Data valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN injurycause.validto IS '{"label": "Valid to date", "description": "Data valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON injurycause TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON injurycause TO ${serviceuser};
GRANT SELECT ON injurycause TO ${readonlyuser};
