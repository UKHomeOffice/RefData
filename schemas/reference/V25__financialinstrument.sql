CREATE TABLE financialinstrument (
  id INT4 NOT NULL PRIMARY KEY,
  type VARCHAR(50) NOT NULL,
  description VARCHAR(50),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE financialinstrument IS '{"label": "Financial currency types", "description": "A list of financial instruments.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN financialinstrument.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN financialinstrument.type IS '{"label": "Status", "description": "The type of currency.", "summaryview": "true"}';
COMMENT ON COLUMN financialinstrument.description IS '{"label": "Status", "description": "A description of the financial instrument.", "summaryview": "true"}';
COMMENT ON COLUMN financialinstrument.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN financialinstrument.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON financialinstrument TO ${anonuser};
GRANT SELECT ON financialinstrument TO ${serviceuser};
GRANT SELECT ON financialinstrument TO ${readonlyuser};
