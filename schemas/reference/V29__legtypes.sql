CREATE TABLE legtypes (
  id INT4 NOT NULL PRIMARY KEY,
  description VARCHAR(60) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE legtypes IS '{"label": "Mode of leg journey", "description": "A description of the journey leg type.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN legtypes.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN legtypes.description IS '{"label": "Description", "description": "A description of the journey type.", "summaryview": "true"}';
COMMENT ON COLUMN legtypes.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN legtypes.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON legtypes TO ${anonuser};
GRANT SELECT ON legtypes TO ${serviceuser};
GRANT SELECT ON legtypes TO ${readonlyuser};
