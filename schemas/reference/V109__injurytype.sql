CREATE TABLE injurytype (
  id INTEGER NOT NULL PRIMARY KEY,
  injurytype VARCHAR(25) NOT NULL,
  description VARCHAR(100), 
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE injurytype is '{"label": "Injury Type", "description": "Different types of Injury.", "schemalastupdated": "17/04/2020", "dataversion": 1}';
-- Column comment
COMMENT ON COLUMN injurytype.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN injurytype.description IS '{"label": "Injury Type", "description": ""}';
COMMENT ON COLUMN injurytype.validfrom IS '{}';
COMMENT ON COLUMN injurytype.validto IS '{}';

-- GRANTs
GRANT SELECT ON injurytype TO ${anonuser};
GRANT SELECT ON injurytype TO ${serviceuser};
GRANT SELECT ON injurytype TO ${readonlyuser};