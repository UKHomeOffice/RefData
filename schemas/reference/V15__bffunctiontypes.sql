CREATE TABLE bffunctiontypes (
  id UUID NOT NULL PRIMARY KEY,
  bffunction VARCHAR(20)  NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE bffunctiontypes IS '{"label": "Border function types", "description": "Border functions type clarifications.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN bffunctiontypes.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN bffunctiontypes.bffunction IS '{"label": "Function", "description": "The type of border crossing.", "summaryview": "true"}';
COMMENT ON COLUMN bffunctiontypes.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN bffunctiontypes.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON bffunctiontypes TO ${anonuser};
GRANT SELECT ON bffunctiontypes TO ${serviceuser};
GRANT SELECT ON bffunctiontypes TO ${readonlyuser};
