CREATE TABLE icao (
  id UUID NOT NULL PRIMARY KEY,
  iso31661alpha2 VARCHAR(2) NULL,
  name VARCHAR(100) NOT NULL,
  iata VARCHAR(3) ,
  municipality VARCHAR(60) ,
  icao VARCHAR(10) NOT NULL,
  geolat NUMERIC NOT NULL,
  geolong NUMERIC NOT NULL,
  type VARCHAR(40),
  countryid INTEGER NULL REFERENCES country(id),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE icao IS '{"label": "ICAO list", "description": "The ICAO worldwide port/location list.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN icao.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN icao.iso31661alpha2 IS '{"label": "2 digit alpha code", "description": "The countries 2 Character alpha code.", "summaryview": "true"}';
COMMENT ON COLUMN icao.name IS '{"label": "Name", "description": "ICAO site name", "summaryview": "true"}';
COMMENT ON COLUMN icao.iata IS '{"label": "IATA", "description": "IATA code", "summaryview": "true"}';
COMMENT ON COLUMN icao.municipality IS '{"label": "City", "description": "Municipality/region", "summaryview": "true", "aliases": ["city", "region"]}';
COMMENT ON COLUMN icao.icao IS '{"label": "ICAO code", "description": "ICAO code", "summaryview": "true"}';
COMMENT ON COLUMN icao.geolat IS '{"label": "Latitude", "description": "Geographic latitude", "summaryview": "false"}';
COMMENT ON COLUMN icao.geolong IS '{"label": "Longitude", "description": "Geographic longitude", "summaryview": "false"}';
COMMENT ON COLUMN icao.type IS '{"label": "Port type", "description": "The type of port.", "summaryview": "true"}';
COMMENT ON COLUMN icao.countryid IS '{"label": "Linked country id", "description": "Country link to Country dataset.", "summaryview": "false"}';
COMMENT ON COLUMN icao.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN icao.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON icao TO ${anonuser};
GRANT SELECT ON icao TO ${serviceuser};
GRANT SELECT ON icao TO ${readonlyuser};
