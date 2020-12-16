CREATE TABLE ppe (
  id INT4 NOT NULL PRIMARY KEY,
  type VARCHAR(35) NOT NULL,
  useofforce BOOLEAN NOT NULL,
  sitesaftey BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE ppe IS '{"label": "PPE", "description": "Different types of PPE for saftey and use of force.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN ppe.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN ppe.type IS '{"label": "Type", "description": "Description of PPE.", "summaryview": "true"}';
COMMENT ON COLUMN ppe.useofforce IS '{"label": "Use of force?", "description": "Is use of force PPE", "summaryview": "true"}';
COMMENT ON COLUMN ppe.sitesaftey IS '{"label": "Site saftey protection", "description": "Is site safety PPE.", "summaryview": "true"}';
COMMENT ON COLUMN ppe.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN ppe.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON ppe TO ${serviceuser};
GRANT SELECT ON ppe TO ${readonlyuser};