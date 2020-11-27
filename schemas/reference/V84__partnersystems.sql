CREATE TABLE partnersystems (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(50),
  shortcode VARCHAR(10),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE partnersystems IS '{"label": "Partner System", "description": "Checks performed against other computer systems.", "schemalastupdated": "28/08/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN partnersystems.id IS '{"label": "Identifier", "businesskey": true, "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN partnersystems.name IS '{"label": "Name", "description": "The name of the computer systems checked.", "summaryview": "true"}';
COMMENT ON COLUMN partnersystems.shortcode IS '{"label": "Short Code", "description": "Short code of the computer system.", "summaryview": "false"}';
COMMENT ON COLUMN partnersystems.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN partnersystems.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON partnersystems TO ${serviceuser};
GRANT SELECT ON partnersystems TO ${readonlyuser};
