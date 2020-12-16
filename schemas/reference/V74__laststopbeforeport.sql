CREATE TABLE laststopbeforeport (
  id INT4 NOT NULL PRIMARY KEY,
  description VARCHAR(40) NOT NULL,
  countryid INTEGER NULL REFERENCES country(id),
  geolat NUMERIC NULL,
  geolong NUMERIC NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE laststopbeforeport IS '{"label": "Last stop before port", "description": "List of last stopping points in Europe before arriving at port.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN laststopbeforeport.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN laststopbeforeport.description IS '{"label": "Description", "description": "Description of stopping point.", "summaryview": "true"}';
COMMENT ON COLUMN laststopbeforeport.countryid IS '{"label": "Linked country id", "description": "Country link to Country dataset.", "summaryview": "false"}';
COMMENT ON COLUMN laststopbeforeport.geolat IS '{"label": "Latitude", "description": "Geographic latitude", "summaryview": "false"}';
COMMENT ON COLUMN laststopbeforeport.geolong IS '{"label": "Longitude", "description": "Geographic longitude", "summaryview": "false"}';
COMMENT ON COLUMN laststopbeforeport.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN laststopbeforeport.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON laststopbeforeport TO ${serviceuser};
GRANT SELECT ON laststopbeforeport TO ${readonlyuser};