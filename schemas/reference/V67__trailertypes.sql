CREATE TABLE trailertypes (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE trailertypes IS '{"label": "Trailer types", "description": "A list of different types of trailer.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN trailertypes.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN trailertypes.name IS '{"label": "Name", "description": "The type of trailer.", "summaryview": "true"}';
COMMENT ON COLUMN trailertypes.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN trailertypes.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON trailertypes TO ${anonuser};
GRANT SELECT ON trailertypes TO ${serviceuser};
GRANT SELECT ON trailertypes TO ${readonlyuser};