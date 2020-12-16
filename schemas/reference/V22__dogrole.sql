CREATE TABLE dogrole (
  id INT4 NOT NULL PRIMARY KEY,
  code VARCHAR(2) NOT NULL,
  description VARCHAR(60) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE dogrole IS '{"label": "Dog role", "description": "A description of the role played by dog team.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN dogrole.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN dogrole.code IS '{"label": "Code", "description": "A list of codes associated with the dog role.", "summaryview": "true"}';
COMMENT ON COLUMN dogrole.description IS '{"label": "Short description", "description": "A description of the dog role.", "summaryview": "true"}';
COMMENT ON COLUMN dogrole.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN dogrole.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON dogrole TO ${anonuser};
GRANT SELECT ON dogrole TO ${serviceuser};
GRANT SELECT ON dogrole TO ${readonlyuser};
