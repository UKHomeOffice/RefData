CREATE TABLE partneragency (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(60) NOT NULL,
  abbreviatedname VARCHAR(50) NOT NULL,
  seizure BOOLEAN NOT NULL,
  intelligence BOOLEAN NOT NULL,
  disclosure BOOLEAN NOT NULL,
  referralfrom BOOLEAN NOT NULL,
  referralto BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE partneragency IS '{"label": "Partner agencies", "description": "A list of partner agencies and associated permissions.", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN partneragency.id IS '{"label": "Identifier", "businesskey": true, "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN partneragency.name IS '{"label": "Name", "description": "Partner agency name", "summaryview": "true"}';
COMMENT ON COLUMN partneragency.abbreviatedname IS '{"label": "Abbreviated name", "description": "Short name of the partner agency.", "summaryview": "true"}';
COMMENT ON COLUMN partneragency.seizure IS '{"label": "Seizure", "description": "Valid seizure partner.", "summaryview": "true"}';
COMMENT ON COLUMN partneragency.intelligence IS '{"label": "Intelligence", "description": "Valid intelligence partner.", "summaryview": "true"}';
COMMENT ON COLUMN partneragency.disclosure IS '{"label": "Disclosure", "description": "Valid disclosure partner.", "summaryview": "true"}';
COMMENT ON COLUMN partneragency.referralfrom IS '{"label": "Referral from", "description": "Partner allowed to make referrals.", "summaryview": "true"}';
COMMENT ON COLUMN partneragency.referralto IS '{"label": "Referral to", "description": "Partner allowed to receive referrals.", "summaryview": "true"}';
COMMENT ON COLUMN partneragency.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN partneragency.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN partneragency.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON partneragency TO ${serviceuser};
GRANT SELECT ON partneragency TO ${readonlyuser};
