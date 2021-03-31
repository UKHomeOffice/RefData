CREATE TABLE sublocation (
  id INTEGER NOT NULL PRIMARY KEY,
  sublocation VARCHAR(35) NOT NULL,
  description VARCHAR(70),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE sublocation IS '{"label": "Sub Location", "description": "A list of Sub Locations of Ports", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN sublocation.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN sublocation.sublocation IS '{"label": "Sub Location", "description": "The name of the Sub Location.", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN sublocation.description IS '{"label": "Description", "description": "A description of the Sub Location.", "summaryview": "true"}';
COMMENT ON COLUMN sublocation.validfrom IS '{"label": "Valid from date", "description": "Sub Location valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN sublocation.validto IS '{"label": "Valid to date", "description": "Sub Location valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN sublocation.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON sublocation TO ${serviceuser};
GRANT SELECT ON sublocation TO ${readonlyuser};
