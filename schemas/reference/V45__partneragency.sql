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
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE partneragency IS '{"label": "Partner agencies", "description": "A list of partner agencies and associated permissions.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN partneragency.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "falßse"}';
COMMENT ON COLUMN partneragency.name IS '{"label": "Name", "description": "Partner agency name", "summaryview": "true"}';
COMMENT ON COLUMN partneragency.abbreviatedname IS '{"label": "Abbreviated name", "description": "Short name of the partner agency.", "summaryview": "true"}';
COMMENT ON COLUMN partneragency.seizure IS '{"label": "Seizure", "description": "Valid seizure partner.", "summaryview": "true"}';
COMMENT ON COLUMN partneragency.intelligence IS '{"label": "Intelligence", "description": "Valid intelligence partner.", "summaryview": "true"}';
COMMENT ON COLUMN partneragency.disclosure IS '{"label": "Disclosure", "description": "Valid disclosure partner.", "summaryview": "true"}';
COMMENT ON COLUMN partneragency.referralfrom IS '{"label": "Referral from", "description": "Partner allowed to make referrals.", "summaryview": "true"}';
COMMENT ON COLUMN partneragency.referralto IS '{"label": "Referral to", "description": "Partner allowed to receive referrals.", "summaryview": "true"}';
COMMENT ON COLUMN partneragency.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN partneragency.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON partneragency TO ${serviceuser};
GRANT SELECT ON partneragency TO ${readonlyuser};
