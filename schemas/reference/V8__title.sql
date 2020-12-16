CREATE TABLE title (
  id INTEGER NOT NULL PRIMARY KEY,
  title VARCHAR(20) NOT NULL UNIQUE,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE title IS '{"label": "Title", "description": "A list of titles to be used when addressing a person.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN title.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN title.title IS '{"label": "Title", "description": "The name of the title.", "summaryview": "true"}';
COMMENT ON COLUMN title.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN title.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON title TO ${anonuser};
GRANT SELECT ON title TO ${serviceuser};
GRANT SELECT ON title TO ${readonlyuser};
