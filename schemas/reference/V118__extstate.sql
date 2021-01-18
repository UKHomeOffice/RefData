CREATE TABLE _data_change_history (
  installedon  TIMESTAMP DEFAULT NOW() NOT NULL PRIMARY KEY,
  scriptname   VARCHAR(100) NOT NULL,

  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE _data_change_history IS '{"label": "Data State", "owner": "cop@homeoffice.gov.uk", "description": "", "schemalastupdated": "08/01/2021", "dataversion": 1}';

-- Column comments
COMMENT ON COLUMN _data_change_history.installedon IS '{"label": "Installation Date", "businessKey": true, "description": "Date of script installation.", "summaryview": "false"}';
COMMENT ON COLUMN _data_change_history.scriptname IS '{"label": "Script Name", "description": "Script name.", "summaryview": "false"}';

COMMENT ON COLUMN flightlookup.validfrom IS '{"label": "Valid from date", "description": "Valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN flightlookup.validto IS '{"label": "Valid to date", "description": "Valid to date.", "summaryview": "false"}';
COMMENT ON COLUMN flightlookup.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON flightlookup TO ${serviceuser};
GRANT SELECT ON flightlookup TO ${readonlyuser};