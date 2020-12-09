CREATE TABLE is81riskfactors (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(100) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE is81riskfactors IS '{"label": "Risk factors", "description": "Risk factors to be considered when issuing an IS81", "schemalastupdated": "24/11/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN is81riskfactors.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN is81riskfactors.name IS '{"label": "Name", "description": "Name of the risk factor", "summaryview": "true"}';
COMMENT ON COLUMN is81riskfactors.description IS '{"label": "Description", "description": "Description of the risk factor", "summaryview": "true"}';
COMMENT ON COLUMN is81riskfactors.validfrom IS '{"label": "Valid from date", "description": "Risk valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN is81riskfactors.validto IS '{"label": "Valid to date", "description": "Risk valid to date.", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON is81riskfactors TO ${serviceuser};
GRANT SELECT ON is81riskfactors TO ${readonlyuser};
