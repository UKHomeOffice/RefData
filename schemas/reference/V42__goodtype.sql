CREATE TABLE goodtype (
  id UUID NOT NULL PRIMARY KEY,
  level1name VARCHAR(60) NOT NULL,
  level2name VARCHAR(60) NOT NULL,
  level3name VARCHAR(60) NOT NULL,
  controlstrategypriority VARCHAR(1),
  description VARCHAR(150),
  enforcedfrom TIMESTAMP WITH TIME ZONE NOT NULL,
  enforcedto TIMESTAMP WITH TIME ZONE,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE goodtype IS '{"label": "Good type", "description": "Customs and seizure good type.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN goodtype.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN goodtype.level1name IS '{"label": "Name level 1", "description": "Name of high level category good.", "summaryview": "true"}';
COMMENT ON COLUMN goodtype.level2name IS '{"label": "Name level 2", "description": "Name of high level category good.", "summaryview": "true"}';
COMMENT ON COLUMN goodtype.level3name IS '{"label": "Name level 3", "description": "Name of high level category good.", "summaryview": "true"}';
COMMENT ON COLUMN goodtype.description IS '{"label": "Description", "description": "Description of good.", "summaryview": "true"}';
COMMENT ON COLUMN goodtype.controlstrategypriority IS '{"label": "Control priority", "description": "Priority of control strategy.", "summaryview": "false"}';
COMMENT ON COLUMN goodtype.enforcedfrom IS '{"label": "Enforce from", "description": "Date controlled enforced from.", "summaryview": "false"}';
COMMENT ON COLUMN goodtype.enforcedto IS '{"label": "Enforced to", "description": "Date controlled enforced to.", "summaryview": "false"}';
COMMENT ON COLUMN goodtype.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN goodtype.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON goodtype TO ${serviceuser};
GRANT SELECT ON goodtype TO ${readonlyuser};
