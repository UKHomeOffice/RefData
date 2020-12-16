CREATE TABLE resistancetypes (
  id INT4 NOT NULL PRIMARY KEY,
  label VARCHAR(30) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE resistancetypes IS '{"label": "Resistance types", "description": "Types of resistance.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN resistancetypes.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN resistancetypes.label IS '{"label": "Resistance", "description": "Description of resistance type.", "summaryview": "true"}';
COMMENT ON COLUMN resistancetypes.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN resistancetypes.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON resistancetypes TO ${serviceuser};
GRANT SELECT ON resistancetypes TO ${readonlyuser};