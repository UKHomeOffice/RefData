CREATE TABLE resistancetypes (
  id INT4 NOT NULL PRIMARY KEY,
  label VARCHAR(30) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE resistancetypes IS '{"label": "Resistance types", "description": "Types of resistance.", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN resistancetypes.id IS '{"label": "Identifier", "businesskey": true, "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN resistancetypes.label IS '{"label": "Resistance", "description": "Description of resistance type.", "summaryview": "true"}';
COMMENT ON COLUMN resistancetypes.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN resistancetypes.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN resistancetypes.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON resistancetypes TO ${serviceuser};
GRANT SELECT ON resistancetypes TO ${readonlyuser};
