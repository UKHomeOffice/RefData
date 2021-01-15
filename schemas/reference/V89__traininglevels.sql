CREATE TABLE traininglevels (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  validpst bool NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

 -- Table comment
COMMENT ON TABLE traininglevels IS '{"label": "Training levels", "description": "Training levels for different courses.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN traininglevels.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN traininglevels.name IS '{"label": "Name", "businesskey": "true", "description": "The name of the level.", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN traininglevels.validpst IS '{"label": "PST", "description": "Is the level valid for PST training?", "summaryview": "true"}';
COMMENT ON COLUMN traininglevels.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN traininglevels.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN traininglevels.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

 -- GRANTs
GRANT SELECT ON traininglevels TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON traininglevels TO ${serviceuser};
GRANT SELECT ON traininglevels TO ${readonlyuser};
