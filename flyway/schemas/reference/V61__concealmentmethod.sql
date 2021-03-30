CREATE TABLE concealmentmethod (
  id INTEGER NOT NULL PRIMARY KEY,
  method VARCHAR(80) NOT NULL,
  person BOOLEAN NOT NULL,
  sea BOOLEAN NOT NULL,
  land BOOLEAN NOT NULL,
  rail BOOLEAN NOT NULL,
  air BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE concealmentmethod IS '{"label": "Concealment methods", "description": "A list containing descriptions of the methods by which items and people are concealed.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN concealmentmethod.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN concealmentmethod.method IS '{"label": "Concealment", "businesskey": "true", "description": "The method of concealment.", "summaryview": "true"}';
COMMENT ON COLUMN concealmentmethod.person IS '{"label": "Person", "description": "Person selection tag.", "summaryview": "true"}';
COMMENT ON COLUMN concealmentmethod.sea IS '{"label": "Sea", "description": "Maritime selection tag.", "summaryview": "true"}';
COMMENT ON COLUMN concealmentmethod.land IS '{"label": "Land", "description": "Land selection tag.", "summaryview": "ture"}';
COMMENT ON COLUMN concealmentmethod.rail IS '{"label": "Rail", "description": "Rail selection tag.", "summaryview": "true"}';
COMMENT ON COLUMN concealmentmethod.air IS '{"label": "Air", "description": "Air selection tag.", "summaryview": "true"}';
COMMENT ON COLUMN concealmentmethod.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN concealmentmethod.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN concealmentmethod.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON concealmentmethod TO ${serviceuser};
GRANT SELECT ON concealmentmethod TO ${readonlyuser};
