CREATE TABLE eventtype (
  id INT4 NOT NULL PRIMARY KEY,
  type VARCHAR(50),
  useofforce BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE eventtype IS '{"label": "Event types", "description": "A list containing different event types.", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN eventtype.id IS '{"label": "Identifier", "description": "Unique identifying column.", "businesskey": true, "summaryview": "false"}';
COMMENT ON COLUMN eventtype.type IS '{"label": "Event types", "businesskey": true, "description": "Descriptions of the different event types.", "summaryview": "true"}';
COMMENT ON COLUMN eventtype.useofforce IS '{"label": "Use of Force", "description": "Is event valid for use of force?.", "summaryview": "true"}';
COMMENT ON COLUMN eventtype.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN eventtype.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN eventtype.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON eventtype TO ${serviceuser};
GRANT SELECT ON eventtype TO ${readonlyuser};
