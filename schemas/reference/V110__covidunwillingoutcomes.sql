CREATE TABLE covidunwillingoutcomes (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE covidunwillingoutcomes IS '{"label": "Covid self declaration unwillingness outcomes", "description": "Set of outcomes when a passenger initially refuses to do the online self declaration ", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN covidunwillingoutcomes.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN covidunwillingoutcomes.name IS '{"label": "Name", "description": "The name of the outcome.", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN covidunwillingoutcomes.validfrom IS '{"label": "Valid from date", "description": "Outcome valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN covidunwillingoutcomes.validto IS '{"label": "Valid to date", "description": "Outcome valid to date.", "summaryview": "false"}';
COMMENT ON COLUMN covidunwillingoutcomes.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON covidunwillingoutcomes TO ${serviceuser};
GRANT SELECT ON covidunwillingoutcomes TO ${readonlyuser};
