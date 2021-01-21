CREATE TABLE intelreferralclassification (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(75) NOT NULL,
  description VARCHAR(150),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE intelreferralclassification IS '{"label": "Intelligence Referral Classificiation", "description": "Classifications of Intelligence Referrals", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "21/01/2021", "dataversion": 1}';
-- Column comment
COMMENT ON COLUMN intelreferralclassification.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN intelreferralclassification.name IS '{"label": "Subcategory", "description": "The SAMS specific subcategory.", "businesskey": "true", "summaryview": "false"}';
COMMENT ON COLUMN intelreferralclassification.description IS '{"label": "Description", "description": "A short description of the subcategory.", "summaryview": "false"}';
COMMENT ON COLUMN intelreferralclassification.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN intelreferralclassification.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';


-- GRANTs
GRANT SELECT,INSERT,UPDATE ON intelreferralclassification TO ${serviceuser};
GRANT SELECT ON intelreferralclassification TO ${readonlyuser};
