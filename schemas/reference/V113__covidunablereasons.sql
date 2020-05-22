CREATE TABLE covidunablereasons (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(40) NOT NULL, 
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE covidunablereasons IS '{"label": "Covid self declaration failure reasons", "description": "Reasons why the passenger Covid self declaration was not done online before travel", "schemalastupdate": "22/05/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN covidunablereasons.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN covidunablereasons.name IS '{"label": "Name", "description": "The name of the reason.", "summaryview": "true"}';
COMMENT ON COLUMN covidunablereasons.validfrom IS '{"label": "Valid from date", "description": "Reason valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN covidunablereasons.validto IS '{"label": "Valid to date", "description": "Reason valid to date.", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON covidunablereasons TO ${anonuser};
GRANT SELECT ON covidunablereasons TO ${serviceuser};
GRANT SELECT ON covidunablereasons TO ${readonlyuser};
