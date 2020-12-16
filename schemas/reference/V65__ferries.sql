CREATE TABLE ferries (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(60) NOT NULL,
  carrierid INT4 NULL REFERENCES carrierlist(id),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE ferries IS '{"label": "Ferries", "description": "A list of ferries that arrive at UK ports.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN ferries.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN ferries.name IS '{"label": "Ferry name", "description": "The name of the ferry.", "summaryview": "true"}';
COMMENT ON COLUMN ferries.carrierid IS '{"label": "Carrier ID", "description": "Link to the carrier list table by id.", "summaryview": "true"}';
COMMENT ON COLUMN ferries.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN ferries.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON ferries TO ${anonuser};
GRANT SELECT ON ferries TO ${serviceuser};
GRANT SELECT ON ferries TO ${readonlyuser};