CREATE TABLE sublocation (
  id INTEGER NOT NULL PRIMARY KEY,
  sublocation VARCHAR(35) NOT NULL,
  description VARCHAR(70),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE sublocation IS '{"label": "Sub Location", "description": "A list of Sub Locations of Ports", "schemalastupdated": "05/12/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN sublocation.id IS '{"label": "Identifier", "businesskey": true, "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN sublocation.sublocation IS '{"label": "Sub Location", "description": "The name of the Sub Location.", "summaryview": "true"}';
COMMENT ON COLUMN sublocation.description IS '{"label": "Description", "description": "A description of the Sub Location.", "summaryview": "true"}';
COMMENT ON COLUMN sublocation.validfrom IS '{"label": "Valid from date", "description": "Sub Location valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN sublocation.validto IS '{"label": "Valid to date", "description": "Sub Location valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON sublocation TO ${anonuser};
GRANT SELECT ON sublocation TO ${serviceuser};
GRANT SELECT ON sublocation TO ${readonlyuser};
