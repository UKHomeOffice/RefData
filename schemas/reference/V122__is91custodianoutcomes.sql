CREATE TABLE is91custodianoutcomes (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(100) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE is91custodianoutcomes IS '{"label": "IS91 Custodian Outcomes", "description": "Custodian outcomes that can arise from an IS91", "schemalastupdated": "24/11/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN is91custodianoutcomes.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN is91custodianoutcomes.name IS '{"label": "Name", "description": "Name of the custodian outcome", "summaryview": "true"}';
COMMENT ON COLUMN is91custodianoutcomes.description IS '{"label": "Description", "description": "Description of the custodian outcome", "summaryview": "true"}';
COMMENT ON COLUMN is91custodianoutcomes.validfrom IS '{"label": "Valid from date", "description": "Outcome valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN is91custodianoutcomes.validto IS '{"label": "Valid to date", "description": "Outcome valid to date.", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON is91custodianoutcomes TO ${serviceuser};
GRANT SELECT ON is91custodianoutcomes TO ${readonlyuser};
