CREATE TABLE eventtype (
  id INT4 NOT NULL PRIMARY KEY,
  type VARCHAR(50),
  useofforce BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE eventtype IS '{"label": "Event types", "description": "A list containing different event types.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN eventtype.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN eventtype.type IS '{"label": "Event types", "businesskey": true, "description": "Descriptions of the different event types.", "summaryview": "true"}';
COMMENT ON COLUMN eventtype.useofforce IS '{"label": "Use of Force", "description": "Is event valid for use of force?.", "summaryview": "true"}';
COMMENT ON COLUMN eventtype.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN eventtype.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON eventtype TO ${serviceuser};
GRANT SELECT ON eventtype TO ${readonlyuser};
