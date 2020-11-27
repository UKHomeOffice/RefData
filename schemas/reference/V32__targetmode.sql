CREATE TABLE targetmode (
  id INT4 NOT NULL PRIMARY KEY,
  mode VARCHAR(60) NOT NULL,
  modecode VARCHAR(8) NOT NULL UNIQUE,
  crossingtype TEXT[],
  ien BOOL NOT NULL,
  ca BOOL NOT NULL,
  ct BOOL NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE targetmode IS '{"label": "Target Modes", "description": "A list of target modes.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN targetmode.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN targetmode.mode IS '{"label": "Target mode", "description": "The targeting mode type.", "summaryview": "true"}';
COMMENT ON COLUMN targetmode.modecode IS '{"label": "Mode Code", "businesskey": true, "description": "Short reference code.", "summaryview": "false"}';
COMMENT ON COLUMN targetmode.crossingtype IS '{"label": "Crossing type", "description": "The type of boarder being crossed.", "summaryview": "false"}';
COMMENT ON COLUMN targetmode.ien IS '{"label": "IEN enabled", "description": "Valid for IEN", "summaryview": "true"}';
COMMENT ON COLUMN targetmode.ca IS '{"label": "Cash enabled", "description": "Valid for Cash targeting", "summaryview": "true"}';
COMMENT ON COLUMN targetmode.ct IS '{"label": "Counter Terrorism enabled", "description": "Valid for CT targeting", "summaryview": "true"}';
COMMENT ON COLUMN targetmode.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN targetmode.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON targetmode TO ${anonuser};
GRANT SELECT ON targetmode TO ${serviceuser};
GRANT SELECT ON targetmode TO ${readonlyuser};
