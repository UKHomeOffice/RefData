CREATE TABLE eventpeopletype (
  id INT4 NOT NULL PRIMARY KEY,
  type VARCHAR(20) NOT NULL,
  description VARCHAR(100) NOT NULL,
  person BOOLEAN NOT NULL,
  organization BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE eventpeopletype IS '{"label": "Types of people", "description": "Types of people in an event.", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN eventpeopletype.id IS '{"label": "Identifier", "description": "Unique identifying column.", "businesskey": true, "summaryview": "false"}';
COMMENT ON COLUMN eventpeopletype.type IS '{"label": "People type", "businesskey": true, "description": "The category of people in the event.", "summaryview": "true"}';
COMMENT ON COLUMN eventpeopletype.description IS '{"label": "Description", "description": "A description of the people in the event.", "summaryview": "true"}';
COMMENT ON COLUMN eventpeopletype.person IS '{"label": "Person type", "description": "Can be used to describe a person at an event.", "summaryview": "true"}';
COMMENT ON COLUMN eventpeopletype.organization IS '{"label": "Organization type", "description": "Can be used to describe a organization at an event.", "summaryview": "true"}';
COMMENT ON COLUMN eventpeopletype.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN eventpeopletype.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN eventpeopletype.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON eventpeopletype TO ${serviceuser};
GRANT SELECT ON eventpeopletype TO ${readonlyuser};
