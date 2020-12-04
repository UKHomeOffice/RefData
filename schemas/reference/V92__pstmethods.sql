CREATE TABLE pstmethods (
  id INT4 NOT NULL PRIMARY KEY,
  method VARCHAR(30) NOT NULL,
  pressure bool NOT NULL,
  nerve bool NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

 -- Table comment
COMMENT ON TABLE pstmethods IS '{"label": "PST Methods", "description": "A list of PST methods", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN pstmethods.id IS '{"label": "Identifier", "businesskey": true, "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN pstmethods.method IS '{"label": "Method", "description": "Technique method", "summaryview": "true"}';
COMMENT ON COLUMN pstmethods.pressure IS '{"label": "Pressure", "description": "Is this a pressure method?", "summaryview": "true"}';
COMMENT ON COLUMN pstmethods.nerve IS '{"label": "Nerve", "description": "Is this a nerve method?", "summaryview": "true"}';
COMMENT ON COLUMN pstmethods.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN pstmethods.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN pstmethods.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

 -- GRANTs
GRANT SELECT ON pstmethods TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON pstmethods TO ${serviceuser};
GRANT SELECT ON pstmethods TO ${readonlyuser};
