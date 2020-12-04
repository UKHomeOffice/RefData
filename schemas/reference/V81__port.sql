CREATE TABLE port (
  id INT4 NOT NULL PRIMARY KEY,
  countryid INTEGER NULL REFERENCES country(id),
  commandid INT4 NULL REFERENCES command(id),
  locationid INT4 NULL REFERENCES location(id),
  name VARCHAR(100) NOT NULL,
  addressid UUID NULL,
  subdivision VARCHAR(3),
  municipality VARCHAR(60),
  geolong NUMERIC,
  geolat NUMERIC,
  air BOOLEAN NULL,
  land BOOLEAN NULL,
  sea BOOLEAN NULL,
  rail BOOLEAN NULL,
  iata VARCHAR(3),
  icao VARCHAR(10) NULL,
  localcode VARCHAR (10) NULL,
  unlocode VARCHAR(3) NULL,
  helipad BOOLEAN NULL,
  fixedpcp BOOLEAN NULL,
  portablepcp BOOLEAN NULL,
  egates BOOLEAN NULL,
  nonoperational BOOLEAN NULL,
  portsizeid int4 NULL,
  juxtaposed BOOLEAN NOT NULL,
  freightparcelposthub BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE NULL,
  validto TIMESTAMP WITH TIME ZONE NULL,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE port IS '{"label": "Worldwide Port list", "businesskey": true, "description": "The list of worldwide port/location list.", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN port.id IS '{"label": "Identifier", "description": "Unique identifying column.", "businesskey": true, "summaryview": "false"}';
COMMENT ON COLUMN port.countryid IS '{"label": "Linked country id", "description": "Country link to Country dataset.", "summaryview": "false"}';
COMMENT ON COLUMN port.commandid IS '{"label": "Linked command id", "description": "Border force command link to command dataset.", "summaryview": "false"}';
COMMENT ON COLUMN port.locationid IS '{"label": "Linked location id", "description": "Border force location link to location dataset.", "summaryview": "false"}';
COMMENT ON COLUMN port.name IS '{"label": "Name", "description": "Site name", "summaryview": "true"}';
COMMENT ON COLUMN port.addressid IS '{"label": "Linked address id", "description": "Links to non Home Office addresses.", "summaryview": "true"}';
COMMENT ON COLUMN port.subdivision IS '{"label": "County Unlocode", "description": "County from unlocode list", "summaryview": "false", "aliases": "region"}';
COMMENT ON COLUMN port.municipality IS '{"label": "City IATA", "description": "Municipality/region from IATA", "summaryview": "true", "aliases": ["city", "region"]}';
COMMENT ON COLUMN port.geolat IS '{"label": "Latitude", "description": "Geographic latitude", "summaryview": "false"}';
COMMENT ON COLUMN port.geolong IS '{"label": "Longitude", "description": "Geographic longitude", "summaryview": "false"}';
COMMENT ON COLUMN port.air IS '{"label": "Air", "description": "Is an Air Port with Runway or Helipad.", "summaryview": "true"}';
COMMENT ON COLUMN port.land IS '{"label": "Land", "description": "Is a land border crossing.", "summaryview": "ture"}';
COMMENT ON COLUMN port.sea IS '{"label": "Sea", "description": "Maritime port of entry.", "summaryview": "true"}';
COMMENT ON COLUMN port.rail IS '{"label": "Rail", "description": "Rail  port of entry.", "summaryview": "true"}';
COMMENT ON COLUMN port.iata IS '{"label": "IATA", "description": "IATA code", "summaryview": "true"}';
COMMENT ON COLUMN port.icao IS '{"label": "ICAO code", "description": "ICAO code", "summaryview": "true"}';
COMMENT ON COLUMN port.localcode IS '{"label": "Local code", "description": "A site code given for ports which do not have iata/icao or unlocode", "summaryview": "true"}';
COMMENT ON COLUMN port.unlocode IS '{"label": "UN location code", "description": "UN location code", "summaryview": "true"}';
COMMENT ON COLUMN port.helipad IS '{"label": "Helipad", "description": "Ii this a helipad.", "summaryview" : "false"}';
COMMENT ON COLUMN port.fixedpcp IS '{"label": "Fixed PCP", "description": "Fixed PCP location.", "summaryview" : "false"}';
COMMENT ON COLUMN port.portablepcp IS '{"label": "Portable PCP", "description": "Portable PCP location.", "summaryview" : "false"}';
COMMENT ON COLUMN port.egates IS '{"label": "Egates", "description": "Egate location.", "summaryview" : "false"}';
COMMENT ON COLUMN port.nonoperational IS '{"label": "Non Operational", "description": "Is this a non-operational location", "summaryview" : "false"}';
COMMENT ON COLUMN port.portsizeid IS '{"label": "BF port size", "description": "Links to Border Force port size list.", "summaryview" : "false"}';
COMMENT ON COLUMN port.juxtaposed IS '{"label": "Juxtaposed", "description": "Is this Port juxtaposed?.", "summaryview" : "false"}';
COMMENT ON COLUMN port.freightparcelposthub IS '{"label": "Freight Parcel Post Hub", "description": "Is this Port a hub for Freight, Parcels and Post?", "summaryview" : "false"}';
COMMENT ON COLUMN port.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN port.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN port.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON port TO ${serviceuser};
GRANT SELECT ON port TO ${readonlyuser};
