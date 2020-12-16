CREATE TABLE modeoftransport (
  id INT4 NOT NULL PRIMARY KEY,
  type VARCHAR(30) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE modeoftransport IS '{"description": "Modes of transport", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN modeoftransport.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN modeoftransport.type IS '{"label": "Type", "description": "Types of transport", "summaryview": "true"}';
COMMENT ON COLUMN modeoftransport.validfrom IS '{"label": "Valid from date", "description": "Item valid from date", "summaryview" : "false"}';
COMMENT ON COLUMN modeoftransport.validto IS '{"label": "Valid to date", "description": "Item valid to date", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON modeoftransport TO ${anonuser};
GRANT SELECT ON modeoftransport TO ${serviceuser};
GRANT SELECT ON modeoftransport TO ${readonlyuser};
