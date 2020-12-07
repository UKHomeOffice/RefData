CREATE TABLE documenttype (
  id INT4 NOT NULL PRIMARY KEY,
  code VARCHAR(2) NOT NULL,
  shortdescription VARCHAR(40) NOT NULL,
  longdescription VARCHAR(100),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE documenttype IS '{"label": "Identity document type", "description": "A list of identification document types.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN documenttype.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN documenttype.code IS '{"label": "Code", "businesskey": true, "description": "System codes associated with the document.", "businesskey": true, "summaryview": "true"}';
COMMENT ON COLUMN documenttype.shortdescription IS '{"label": "Short description", "description": "Short description of the documane code.", "summaryview": "true"}';
COMMENT ON COLUMN documenttype.longdescription IS '{"label": "Long description", "description": "Long description of the document code.", "summaryview": "true"}';
COMMENT ON COLUMN documenttype.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN documenttype.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN documenttype.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON documenttype TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON documenttype TO ${serviceuser};
GRANT SELECT ON documenttype TO ${readonlyuser};
