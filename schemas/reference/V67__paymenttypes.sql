CREATE TABLE paymenttypes (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE paymenttypes IS '{"label": "Payment types", "description": "A list of different types of payment methods.", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN paymenttypes.id IS '{"label": "Identifier", "businesskey": true, "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN paymenttypes.name IS '{"label": "Name", "description": "The type of payment.", "summaryview": "true"}';
COMMENT ON COLUMN paymenttypes.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN paymenttypes.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN paymenttypes.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON paymenttypes TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON paymenttypes TO ${serviceuser};
GRANT SELECT ON paymenttypes TO ${readonlyuser};
