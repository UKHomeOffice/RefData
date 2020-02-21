CREATE TABLE brand (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(40),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE brand IS '{"label":"Brand Names", "description":"Common product brands", "schemalastupdated": "20/02/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN brand.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN brand.name IS '{"label": "Brand Name", "description": "The name given to the brand.", "summaryview": "true"}';
COMMENT ON COLUMN brand.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN brand.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- Grants
GRANT SELECT ON brand TO ${anonuser};
GRANT SELECT ON brand TO ${serviceuser};
GRANT SELECT ON brand TO ${readonlyuser};