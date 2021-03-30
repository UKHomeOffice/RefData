CREATE TABLE indicators (
  id INT4 NOT NULL PRIMARY KEY,
  indicator VARCHAR(200),
  ct BOOLEAN NOT NULL,
  ien BOOLEAN NOT NULL,
  referral BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE indicators IS '{"label": "Intelligence indicators", "description": "A list of intelligence indicator types.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN indicators.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN indicators.indicator IS '{"label": "Indicator description", "description": "The type of indicator.", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN indicators.ct IS '{"label": "CT", "description": "Valid type for counter terrorism.", "summaryview": "true"}';
COMMENT ON COLUMN indicators.ien IS '{"label": "IEN", "description": "Valid type for immediate event notification.", "summaryview": "true"}';
COMMENT ON COLUMN indicators.referral IS '{"label": "Referral", "description": "Valid types for referrals.", "summaryview": "true"}';
COMMENT ON COLUMN indicators.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN indicators.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN indicators.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON indicators TO ${serviceuser};
GRANT SELECT ON indicators TO ${readonlyuser};
