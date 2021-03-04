CREATE TABLE breachreason (
  id INT4 NOT NULL PRIMARY KEY,
  label VARCHAR(50) NOT NULL,
  description VARCHAR(100) NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE breachreason IS '{"label": "Breach reason", "description": "The reason that a breach occured", "schemalastupdated": "02/03/2021", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN breachreason.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN breachreason.label IS '{"label": "label", "description": "Name of the reason", "summaryview": "true"}';
COMMENT ON COLUMN breachreason.description IS '{"label": "Description", "description": "Description of the reason", "summaryview": "true"}';
COMMENT ON COLUMN breachreason.validfrom IS '{"label": "Valid from date", "description": "Breach reason valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN breachreason.validto IS '{"label": "Valid to date", "description": "Breach reason valid to date.", "summaryview": "false"}';
COMMENT ON COLUMN breachreason.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON breachreason TO ${serviceuser};
GRANT SELECT ON breachreason TO ${readonlyuser};
