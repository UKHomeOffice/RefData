CREATE TABLE laststopbeforeport (
  id INT4 NOT NULL PRIMARY KEY,
  description VARCHAR(40) NOT NULL,
  countryid INTEGER NULL REFERENCES country(id),
  geolat NUMERIC NULL,
  geolong NUMERIC NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE laststopbeforeport IS '{"label": "Last stop before port", "description": "List of last stopping points in Europe before arriving at port.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN laststopbeforeport.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN laststopbeforeport.description IS '{"label": "Description", "description": "Description of stopping point.", "businesskey": true, "summaryview": "true"}';
COMMENT ON COLUMN laststopbeforeport.countryid IS '{"label": "Linked country id", "description": "Country link to Country dataset.", "summaryview": "false"}';
COMMENT ON COLUMN laststopbeforeport.geolat IS '{"label": "Latitude", "description": "Geographic latitude", "summaryview": "false"}';
COMMENT ON COLUMN laststopbeforeport.geolong IS '{"label": "Longitude", "description": "Geographic longitude", "summaryview": "false"}';
COMMENT ON COLUMN laststopbeforeport.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN laststopbeforeport.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN laststopbeforeport.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON laststopbeforeport TO ${serviceuser};
GRANT SELECT ON laststopbeforeport TO ${readonlyuser};
