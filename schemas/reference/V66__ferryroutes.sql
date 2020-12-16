CREATE TABLE ferryroutes (
  id INT4 NOT NULL PRIMARY KEY,
  route VARCHAR(60) NOT NULL,
  carrierid INT4 NULL REFERENCES carrierlist(id),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE ferryroutes IS '{"label": "Ferry crossing routes", "description": "A list of ferry routes to the UK.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN ferryroutes.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN ferryroutes.route IS '{"label": "Crossing route", "description": "The name of crossing route.", "summaryview": "true"}';
COMMENT ON COLUMN ferryroutes.carrierid IS '{"label": "Carrier ID", "description": "Link to the carrier list table by id.", "summaryview": "true"}';
COMMENT ON COLUMN ferryroutes.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN ferryroutes.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON ferryroutes TO ${anonuser};
GRANT SELECT ON ferryroutes TO ${serviceuser};
GRANT SELECT ON ferryroutes TO ${readonlyuser};