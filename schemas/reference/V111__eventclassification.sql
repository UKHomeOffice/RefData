CREATE TABLE eventclassification (
  id INT4 NOT NULL PRIMARY KEY,
  label VARCHAR(60) NOT NULL,
  description VARCHAR(150) NOT NULL,
  isvariance BOOLEAN NOT NULL,
  iscontrolbreach BOOLEAN NOT NULL,
  ismandatebreach BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE eventclassification IS '{"label": "Event Classification", "description": "Classification of breach events", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN eventclassification.id IS '{"label": "Identifier", "description": "Database unique identity record.", "businesskey": "true", "summaryview": "false"}';
COMMENT ON COLUMN eventclassification.label IS '{"label": "Label", "description": "The label for the breach type", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN eventclassification.description IS '{"label": "Description", "description": "The description of the breach type", "summaryview": "true"}';
COMMENT ON COLUMN eventclassification.isvariance IS '{"label": "Variance", "description": "Is the event a Variance?", "summaryview": "false"}';
COMMENT ON COLUMN eventclassification.iscontrolbreach IS '{"label": "Control Breach", "description": "Is the event a Control Breach?", "summaryview": "false"}';
COMMENT ON COLUMN eventclassification.ismandatebreach IS '{"label": "Mandate Breach", "description": "Is the event a Mandate Breach?", "summaryview": "false"}';
COMMENT ON COLUMN eventclassification.validfrom IS '{"label": "Valid from date", "description": "Classification valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN eventclassification.validto IS '{"label": "Valid to date", "description": "Classification valid to date.", "summaryview": "false"}';
COMMENT ON COLUMN eventclassification.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON eventclassification TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON eventclassification TO ${serviceuser};
GRANT SELECT ON eventclassification TO ${readonlyuser};
