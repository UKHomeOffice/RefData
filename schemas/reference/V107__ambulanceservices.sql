CREATE TABLE ambulanceservices (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(100),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE ambulanceservices IS '{"label":"", "description":"Ambulance Services", "schemalastupdated": "26/03/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN ambulanceservices.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN ambulanceservices.name IS '{"label": "Ambulance Service Name", "description": "The name given to the Ambulance Service.", "summaryview": "true"}';
COMMENT ON COLUMN ambulanceservices.validfrom IS '{"label": "Valid from date", "description": "Ambulance Service valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN ambulanceservices.validto IS '{"label": "Valid to date", "description": "Ambulance Service valid to date.", "summaryview" : "false"}';

-- Grants
GRANT SELECT ON ambulanceservices TO ${anonuser};
GRANT SELECT ON ambulanceservices TO ${serviceuser};
GRANT SELECT ON ambulanceservices TO ${readonlyuser};
