CREATE TABLE terminal (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE terminal IS '{"label": "Terminals", "description": "A list of terminal options.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN terminal.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN terminal.name IS '{"label": "Name", "description": "Name of the terminal.", "businesskey": true, "summaryview": "false"}';
COMMENT ON COLUMN terminal.validfrom IS '{"label": "Valid from date", "description": "Terminal valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN terminal.validto IS '{"label": "Valid to date", "description": "Terminal valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN terminal.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- Grants
GRANT SELECT ON terminal TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON terminal TO ${serviceuser};
GRANT SELECT ON terminal TO ${readonlyuser};
