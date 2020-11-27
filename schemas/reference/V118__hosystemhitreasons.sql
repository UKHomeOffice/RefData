CREATE TABLE hosystemhitreasons (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(100) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE hosystemhitreasons IS '{"label": "HO System Hit Reasons", "description": "A list of reasons why there could be a hit on the system", "schemalastupdated": "24/11/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN hosystemhitreasons.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN hosystemhitreasons.name IS '{"label": "Name", "description": "Name of the reason", "summaryview": "true"}';
COMMENT ON COLUMN hosystemhitreasons.description IS '{"label": "Description", "description": "Description of the reason", "summaryview": "true"}';
COMMENT ON COLUMN hosystemhitreasons.validfrom IS '{"label": "Valid from date", "description": "Hit reason valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN hosystemhitreasons.validto IS '{"label": "Valid to date", "description": "Hit reason valid to date.", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON hosystemhitreasons TO ${serviceuser};
GRANT SELECT ON hosystemhitreasons TO ${readonlyuser};
