CREATE TABLE flightlookup (
  id VARCHAR(20) NOT NULL PRIMARY KEY,
  flightnumber VARCHAR(10) NOT NULL,
  operator VARCHAR(50) NOT NULL,
  departurecountryid INTEGER NOT NULL,
  arrivalcountryid INTEGER NOT NULL,
  departureairport VARCHAR(5) NOT NULL,
  arrivalairport VARCHAR(5) NOT NULL,

  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE flightlookup IS '{"label": "Flight Numbers", "owner": "cop@homeoffice.gov.uk", "description": "Scheduled flight numbers", "schemalastupdated": "08/01/2021", "dataversion": 1}';

-- Column comments
COMMENT ON COLUMN flightlookup.id IS '{"label": "Identifier", "businessKey": true, "description": "Unique identifying column, coposed from flight number and flight time.", "summaryview": "false"}';
COMMENT ON COLUMN flightlookup.flightnumber IS '{"label": "Flight Number", "description": "Flight number", "summaryview": "true"}';
COMMENT ON COLUMN flightlookup.operator IS '{"label": "Flight Operator", "description": "Full name of flight operator", "summaryview": "true"}';
COMMENT ON COLUMN flightlookup.departurecountryid IS '{"label": "Departure Country", "description": "ID of departure country (see country ref table).", "summaryview": "true"}';
COMMENT ON COLUMN flightlookup.arrivalcountryid IS '{"label": "Arrival Country", "description": "ID of arrival country (see country ref table).", "summaryview": "true"}';
COMMENT ON COLUMN flightlookup.departureairport IS '{"label": "Departure Airport IATA", "description": "Departure Airport IATA", "summaryview": "true"}';
COMMENT ON COLUMN flightlookup.arrivalairport IS '{"label": "Arrival Airport IATA", "description": "Arrival Airport IATA", "summaryview": "true"}';

COMMENT ON COLUMN flightlookup.validfrom IS '{"label": "Valid from date", "description": "Valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN flightlookup.validto IS '{"label": "Valid to date", "description": "Valid to date.", "summaryview": "false"}';
COMMENT ON COLUMN flightlookup.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE,DELETE ON flightlookup TO ${serviceuser};  -- we will need to delete old data often
GRANT SELECT ON flightlookup TO ${readonlyuser};
