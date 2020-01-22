CREATE TABLE detectionmethod (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(60) NOT NULL,
  detectionequipment BOOLEAN NOT NULL,
  basicequipment BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE detectionmethod IS '{"label": "Detection methods", "description": "A list of different types of detection method.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN detectionmethod.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN detectionmethod.name IS '{"label": "Detection method", "description": "The type of detection method.", "summaryview": "true"}';
COMMENT ON COLUMN detectionmethod.detectionequipment IS '{"label": "Detection equiptment", "description": "The epuiptment used in detection events.", "summaryview": "true"}';
COMMENT ON COLUMN detectionmethod.basicequipment IS '{"label": "Basic equipment", "description": "Equiptment is considered basic.", "summaryview": "true"}';
COMMENT ON COLUMN detectionmethod.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN detectionmethod.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON detectionmethod TO ${serviceuser};
GRANT SELECT ON detectionmethod TO ${readonlyuser};