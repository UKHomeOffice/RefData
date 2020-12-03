CREATE TABLE outcomes (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  nationalsecurity BOOLEAN,
  remark BOOLEAN,
  nofurtheraction BOOLEAN,
  description VARCHAR(100),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE outcomes IS '{"label": "outcomes", "description": "The outcome of an event.", "schemalastupdated": "03/10/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN outcomes.id IS '{"label": "Identifier", "businesskey": true, "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN outcomes.name IS '{"label": "Name", "description": "A description of the outcome.", "summaryview": "true"}';
COMMENT ON COLUMN outcomes.nationalsecurity IS '{"label": "National Security", "description": "Is this outcome related to NS / CT?", "summaryview": "false"}';
COMMENT ON COLUMN outcomes.remark IS '{"label": "Remark", "description": "Is this a remark?", "summaryview": "false"}';
COMMENT ON COLUMN outcomes.nofurtheraction IS '{"label": "No Further Action", "description": "Is this an option for no further action", "summaryview": "false"}';
COMMENT ON COLUMN outcomes.description IS '{"label": "Description", "description": "A definition of the outcome.", "summaryview": "true"}';
COMMENT ON COLUMN outcomes.validfrom IS '{"label": "Valid from date", "description": "Item no further valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN outcomes.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON outcomes TO ${serviceuser};
GRANT SELECT ON outcomes TO ${readonlyuser};
