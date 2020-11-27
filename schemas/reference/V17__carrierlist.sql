CREATE TABLE carrierlist (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(60) NOT NULL,
  twolettercode VARCHAR(2),
  threelettercode VARCHAR(3),
  designator INT4,
  alliance VARCHAR(60) ,
  aviation BOOLEAN NOT NULL,
  sea BOOLEAN NOT NULL,
  land BOOLEAN NOT NULL,
  rail BOOLEAN NOT NULL,
  parcel BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE carrierlist IS '{"label": "Carriers", "description": "A list of Carriers.", "schemalastupdated": "02/06/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN carrierlist.id IS '{"label": "Identifier", "businesskey": true, "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN carrierlist.name IS '{"label": "Carrier name", "description": "The name of the carrier.", "summaryview": "true"}';
COMMENT ON COLUMN carrierlist.twolettercode IS '{"label": "Two letter code", "description": "The 2 letter carrier code.", "summaryview": "true"}';
COMMENT ON COLUMN carrierlist.threelettercode IS '{"label": "Three letter code", "description": "The 3 letter carrier code.", "summaryview": "true"}';
COMMENT ON COLUMN carrierlist.designator IS '{"label": "Airline designator", "description": "The airline designator code.", "summaryview": "true"}';
COMMENT ON COLUMN carrierlist.alliance IS '{"label": "Alliance code", "description": "The alliance partnership code.", "summaryview": "true"}';
COMMENT ON COLUMN carrierlist.aviation IS '{"label": "Aviation", "description": "Aviation carrier?", "summaryview": "true"}';
COMMENT ON COLUMN carrierlist.sea IS '{"label": "Sea", "description": "Maritime carrier?", "summaryview": "true"}';
COMMENT ON COLUMN carrierlist.land IS '{"label": "Land", "description": "Land carrier?", "summaryview": "true"}';
COMMENT ON COLUMN carrierlist.rail IS '{"label": "Rail", "description": "Rail carrier?", "summaryview": "true"}';
COMMENT ON COLUMN carrierlist.parcel IS '{"label": "Parcel", "description": "Parcel carrier for the purposes of Fast Parcels?", "summaryview": "true"}';
COMMENT ON COLUMN carrierlist.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN carrierlist.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON carrierlist TO ${anonuser};
GRANT SELECT ON carrierlist TO ${serviceuser};
GRANT SELECT ON carrierlist TO ${readonlyuser};
