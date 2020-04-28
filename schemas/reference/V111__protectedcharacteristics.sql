CREATE TABLE protectedcharacteristics (
  id INT4 NOT NULL PRIMARY KEY,
  characteristic VARCHAR(40) NOT NULL, 
  description VARCHAR(150),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE protectedcharacteristics IS '{"label": "Protected characteristics", "description": "Characteristics which are protected from discrimination by law", "schemalastupdate": "27/04/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN protectedcharacteristics.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN protectedcharacteristics.characteristic IS '{"label": "Characteristic", "description": "The name of the characteristic being protected.", "summaryview": "true"}';
COMMENT ON COLUMN protectedcharacteristics.description IS '{"label": "Description", "description": "A short description of the characteristic", "summaryview": "true"}';
COMMENT ON COLUMN protectedcharacteristics.validfrom IS '{"label": "Valid from date", "description": "Sub Location valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN protectedcharacteristics.validto IS '{"label": "Valid to date", "description": "Sub Location valid to date.", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON protectedcharacteristics TO ${anonuser};
GRANT SELECT ON protectedcharacteristics TO ${serviceuser};
GRANT SELECT ON protectedcharacteristics TO ${readonlyuser};
