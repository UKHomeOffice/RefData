CREATE TABLE maritimezone (
  id INTEGER NOT NULL PRIMARY KEY,
  code CHAR(3) NOT NULL,
  name VARCHAR(40),
  area json,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE maritimezone IS '{"label": "Maritime Zone", "description": "Areas of UK territorial waters.", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN maritimezone.id IS '{"label": "Identifier", "description": "Unique identifying column.", "businesskey": true, "summaryview": "false"}';
COMMENT ON COLUMN maritimezone.code IS '{"label": "Code", "businesskey": true, "description": "A unique two letter code for the zone.", "summaryview": "true"}';
COMMENT ON COLUMN maritimezone.name IS '{"label": "Name", "description": "The non-abbreviated name of the zone.", "summaryview": "true"}';
COMMENT ON COLUMN maritimezone.area IS '{"label": "Area", "description": "The Geo JSON coordinates of the area.", "summaryview": "false"}';
COMMENT ON COLUMN maritimezone.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN maritimezone.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN maritimezone.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON maritimezone TO ${serviceuser};
GRANT SELECT ON maritimezone TO ${readonlyuser};
