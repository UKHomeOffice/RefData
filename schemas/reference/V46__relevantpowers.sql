CREATE TABLE relevantpowers (
  id INT4 NOT NULL PRIMARY KEY,
  code VARCHAR(40) NOT NULL,
  fullname VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  url VARCHAR(100),
  sop BOOLEAN NOT NULL,
  legalgateway BOOLEAN NOT NULL,
  useofforce BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE relevantpowers IS '{"label": "Relevant Powers",  "description": "Legal powers that can be used.", "schemalastupdated": "24/07/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN relevantpowers.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN relevantpowers.code IS '{"label": "Legal code", "description": "The code of the relevant power.", "summaryview": "true"}';
COMMENT ON COLUMN relevantpowers.fullname IS '{"label": "Name", "description": "The name of the relevant power.", "summaryview": "true"}';
COMMENT ON COLUMN relevantpowers.description IS '{"label": "Description", "description": "A short description of the power.", "summaryview": "true"}';
COMMENT ON COLUMN relevantpowers.url IS '{"label": "URL", "description": "Link to the full power in legislation.", "summaryview": "true"}';
COMMENT ON COLUMN relevantpowers.sop IS '{"label": "SoP", "description": "Valid power for search of person.", "summaryview": "false"}';
COMMENT ON COLUMN relevantpowers.legalgateway IS '{"label": "Legal Gateway", "description": "Is this a legal gateway?", "summaryview": "false"}';
COMMENT ON COLUMN relevantpowers.useofforce IS '{"label": "UoF", "description": "Is this applicable to Use of Force?", "summaryview": "false"}';
COMMENT ON COLUMN relevantpowers.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN relevantpowers.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON relevantpowers TO ${serviceuser};
GRANT SELECT ON relevantpowers TO ${readonlyuser};
