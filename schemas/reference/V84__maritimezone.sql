CREATE TABLE maritimezone (
  id INTEGER NOT NULL PRIMARY KEY,
  code CHAR(3) NOT NULL,
  name VARCHAR(40),
  area json,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE maritimezone IS '{"label": "Maritime Zone", "description": "Areas of UK territorial waters.", "schemalastupdated": "07/08/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN maritimezone.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN maritimezone.code IS '{"label": "Code", "description": "A unique two letter code for the zone.", "summaryview": "true"}';
COMMENT ON COLUMN maritimezone.name IS '{"label": "Name", "description": "The non-abbreviated name of the zone.", "summaryview": "true"}';
COMMENT ON COLUMN maritimezone.area IS '{"label": "Area", "description": "The Geo JSON coordinates of the area.", "summaryview": "false"}';
COMMENT ON COLUMN maritimezone.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN maritimezone.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON maritimezone TO ${serviceuser};
GRANT SELECT ON maritimezone TO ${readonlyuser};
