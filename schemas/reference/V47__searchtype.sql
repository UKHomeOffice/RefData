CREATE TABLE searchtype (
  id INT4 NOT NULL PRIMARY KEY,
  type VARCHAR(50) NOT NULL,
  relevantpowerid INT4 NOT NULL REFERENCES relevantpowers(id),
  description TEXT,
  usedonobject BOOLEAN,
  usedonhuman BOOLEAN,
  searchofperson BOOLEAN,
  searchofbags BOOLEAN,
  searchofvehicle BOOLEAN,
  searchofaccfreight BOOLEAN,
  searchofunaccfreight BOOLEAN,
  searchofcontainers BOOLEAN,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE searchtype IS '{"label": "Search type", "description": "A list of the types of search that can be performed.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN searchtype.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.type IS '{"label": "Search type", "description": "The type of search.", "summaryview": "true"}';
COMMENT ON COLUMN searchtype.description IS '{"label": "Description", "description": "A description of the search.", "summaryview": "true"}';
COMMENT ON COLUMN searchtype.usedonobject IS '{"label": "Object", "description": "Allowed to be used on objects.", "summaryview": "true"}';
COMMENT ON COLUMN searchtype.usedonhuman IS '{"label": "Human", "description": "Allowed to be used on humans.", "summaryview": "true"}';
COMMENT ON COLUMN searchtype.searchofperson IS '{"label": "Search of person", "description": "Involves the search of a person.", "summaryview": "true"}';
COMMENT ON COLUMN searchtype.searchofbags IS '{"label": "Search of Bags", "description": "Involves the search of a bag.", "summaryview": "true"}';
COMMENT ON COLUMN searchtype.searchofvehicle IS '{"label": "Search of vehicle", "description": "Involves the search of a vehicle.", "summaryview": "true"}';
COMMENT ON COLUMN searchtype.searchofaccfreight IS '{"label": "Search of ACC freight", "description": "Involves the search of an ACC freight.", "summaryview": "true"}';
COMMENT ON COLUMN searchtype.searchofunaccfreight IS '{"label": "Search of Non-ACC freight", "description": "Involves the search of a Non-ACC freight.", "summaryview": "true"}';
COMMENT ON COLUMN searchtype.searchofcontainers IS '{"label": "Search of containers", "description": "Involves the search of a container.", "summaryview": "true"}';
COMMENT ON COLUMN searchtype.relevantpowerid IS '{"label": "Relevant power ID", "description": "A link to the relevant power entity.", "summaryview" : "false"}';
COMMENT ON COLUMN searchtype.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN searchtype.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON searchtype TO ${serviceuser};
GRANT SELECT ON searchtype TO ${readonlyuser};



