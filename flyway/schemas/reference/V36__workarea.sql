CREATE TABLE workarea (
  id INT4 NOT NULL PRIMARY KEY,
  area VARCHAR(40) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE workarea IS '{"label": "Working areas", "description": "A list of working areas.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN workarea.id IS '{"label": "Identifier", "businesskey": "true", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN workarea.area IS '{"label": "Area", "description": "A short description of the working area.", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN workarea.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN workarea.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN workarea.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON workarea TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON workarea TO ${serviceuser};
GRANT SELECT ON workarea TO ${readonlyuser};
