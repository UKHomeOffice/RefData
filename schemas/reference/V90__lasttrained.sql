CREATE TABLE lasttrained (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  validpst bool NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

 -- Table comment
COMMENT ON TABLE lasttrained IS '{"label": "Last Trained", "description": "When were you last trained periods", owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN lasttrained.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN lasttrained.name IS '{"label": "Name", "description": "Last trained period.", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN lasttrained.validpst IS '{"label": "PST", "description": "Is the period valid for PST training?", "summaryview": "true"}';
COMMENT ON COLUMN lasttrained.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN lasttrained.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN lasttrained.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

 -- GRANTs
GRANT SELECT ON lasttrained TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON lasttrained TO ${serviceuser};
GRANT SELECT ON lasttrained TO ${readonlyuser};
