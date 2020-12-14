CREATE TABLE protectedcharacteristics (
  id INT4 NOT NULL PRIMARY KEY,
  characteristic VARCHAR(40) NOT NULL,
  description VARCHAR(150),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE protectedcharacteristics IS '{"label": "Protected characteristics", "description": "Characteristics which are protected from discrimination by law", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN protectedcharacteristics.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN protectedcharacteristics.characteristic IS '{"label": "Characteristic", "description": "The name of the characteristic being protected.", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN protectedcharacteristics.description IS '{"label": "Description", "description": "A short description of the characteristic", "summaryview": "true"}';
COMMENT ON COLUMN protectedcharacteristics.validfrom IS '{"label": "Valid from date", "description": "Sub Location valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN protectedcharacteristics.validto IS '{"label": "Valid to date", "description": "Sub Location valid to date.", "summaryview": "false"}';
COMMENT ON COLUMN protectedcharacteristics.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON protectedcharacteristics TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON protectedcharacteristics TO ${serviceuser};
GRANT SELECT ON protectedcharacteristics TO ${readonlyuser};


