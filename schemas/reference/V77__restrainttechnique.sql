CREATE TABLE restrainttechnique (
  id INT4 NOT NULL PRIMARY KEY,
  label VARCHAR(35) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE restrainttechnique IS '{"label": "Restraint Technique", "description": "What restraint method was used?", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN restrainttechnique.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN restrainttechnique.label IS '{"label": "Technique", "description": "Description of restraint method.", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN restrainttechnique.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN restrainttechnique.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN restrainttechnique.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON restrainttechnique TO ${serviceuser};
GRANT SELECT ON restrainttechnique TO ${readonlyuser};
