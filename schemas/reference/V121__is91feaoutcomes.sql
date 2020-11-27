CREATE TABLE is91feaoutcomes (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description TEXT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE is91feaoutcomes IS '{"label": "IS91 Outcomes", "description": "Outcomes that can arise from an IS91", "schemalastupdated": "24/11/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN is91feaoutcomes.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN is91feaoutcomes.name IS '{"label": "Name", "description": "Name of the outcome", "summaryview": "true"}';
COMMENT ON COLUMN is91feaoutcomes.description IS '{"label": "Description", "description": "Description of the outcome", "summaryview": "true"}';
COMMENT ON COLUMN is91feaoutcomes.validfrom IS '{"label": "Valid from date", "description": "Outcome valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN is91feaoutcomes.validto IS '{"label": "Valid to date", "description": "Outcome valid to date.", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON is91feaoutcomes TO ${serviceuser};
GRANT SELECT ON is91feaoutcomes TO ${readonlyuser};
