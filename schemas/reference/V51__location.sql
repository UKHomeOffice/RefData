CREATE TABLE location (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description TEXT,
  unlocodeid UUID REFERENCES unlocode(id),
  addressid UUID NOT NULL REFERENCES address(id),
  geolat NUMERIC NOT NULL,
  geolong NUMERIC NOT NULL,
  icaoid UUID REFERENCES icao(id),
  bflocationtypeid UUID REFERENCES bflocationtype(id),
  code VARCHAR(8) NOT NULL,
  countryoflegalsystem VARCHAR(20),
  ukcountry VARCHAR(20),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE location IS '{"label": "Location", "description": "A list of locations and their associated details.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN location.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN location.name IS '{"label": "Name", "description": "Location name", "businesskey": true, "summaryview": "true"}';
COMMENT ON COLUMN location.geolat IS '{"label": "Latitude", "description": "Geographic latitude", "summaryview": "false"}';
COMMENT ON COLUMN location.geolong IS '{"label": "Longitude", "description": "Geographic longitude", "summaryview": "false"}';
COMMENT ON COLUMN location.description IS '{"label": "Description", "description": "A description of the location.", "summaryview": "true"}';
COMMENT ON COLUMN location.code IS '{"label": "Code", "businesskey": true, "description": "The locatioon code.", "summaryview": "true"}';
COMMENT ON COLUMN location.unlocodeid IS '{"label": "UN Location Code ID", "description": "Link to unlocode entity.", "summaryview" : "false"}';
COMMENT ON COLUMN location.addressid IS '{"label": "Address ID", "description": "Link to address entity.", "summaryview" : "false"}';
COMMENT ON COLUMN location.icaoid IS '{"label": "ICAO Code ID", "description": "Link to ICAO entity.", "summaryview" : "false"}';
COMMENT ON COLUMN location.bflocationtypeid IS '{"label": "BF location type ID", "description": "Link to bflocationtype entity.", "summaryview" : "false"}';
COMMENT ON COLUMN location.countryoflegalsystem IS '{"label": "Country of Legal System", "description": "Which of the UKs devolved legal systems does this location come under.", "summaryview": "false"}';
COMMENT ON COLUMN location.ukcountry IS '{"label": "UK Country", "description": "Which of the UKs countries is this location in", "summaryview" : "true"}';
COMMENT ON COLUMN location.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN location.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN location.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON location TO ${serviceuser};
GRANT SELECT ON location TO ${readonlyuser};
