CREATE TABLE typeofmisdirection (
  id INT4 NOT NULL PRIMARY KEY,
  label VARCHAR(50) NOT NULL,
  description VARCHAR(100) NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE typeofmisdirection IS '{"label": "Type of misdirection", "description": "The type of misdirection", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "02/03/2021", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN typeofmisdirection.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN typeofmisdirection.label IS '{"label": "label", "description": "Name of the misdirection", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN typeofmisdirection.description IS '{"label": "Description", "description": "Description of the misdirection", "summaryview": "true"}';
COMMENT ON COLUMN typeofmisdirection.validfrom IS '{"label": "Valid from date", "description": "Breach reason valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN typeofmisdirection.validto IS '{"label": "Valid to date", "description": "Breach reason valid to date.", "summaryview": "false"}';
COMMENT ON COLUMN typeofmisdirection.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON typeofmisdirection TO ${serviceuser};
GRANT SELECT ON typeofmisdirection TO ${readonlyuser};
