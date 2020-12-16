CREATE TABLE crewrole (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  description VARCHAR(60),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE crewrole IS '{"label": "Crew role", "description": "Crew position and role description.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN crewrole.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN crewrole.name IS '{"label": "Name", "description": "The name of the crew position.", "summaryview": "true"}';
COMMENT ON COLUMN crewrole.description IS '{"label": "Description", "description": "A Description of the role.", "summaryview": "true"}';
COMMENT ON COLUMN crewrole.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN crewrole.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON crewrole TO ${anonuser};
GRANT SELECT ON crewrole TO ${serviceuser};
GRANT SELECT ON crewrole TO ${readonlyuser};
