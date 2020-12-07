CREATE TABLE legtypes (
  id INT4 NOT NULL PRIMARY KEY,
  description VARCHAR(60) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE legtypes IS '{"label": "Mode of leg journey", "description": "A description of the journey leg type.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN legtypes.id IS '{"label": "Identifier", "businesskey": true, "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN legtypes.description IS '{"label": "Description", "description": "A description of the journey type.", "businesskey": true, "summaryview": "true"}';
COMMENT ON COLUMN legtypes.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN legtypes.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN legtypes.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON legtypes TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON legtypes TO ${serviceuser};
GRANT SELECT ON legtypes TO ${readonlyuser};
