CREATE TABLE intelligenceproducttype (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(200),
  incoming boolean,
  outgoing boolean,
  outgoinganalyst boolean,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE intelligenceproducttype IS '{"label": "Intelligence product type", "description": "Types of intelligence product.", "schemalastupdated": "28/08/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN intelligenceproducttype.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN intelligenceproducttype.name IS '{"label": "Name", "businesskey": true, "description": "Name of the product.", "summaryview": "true"}';
COMMENT ON COLUMN intelligenceproducttype.description IS '{"label": "Description", "description": "A description of the product.", "summaryview": "true"}';
COMMENT ON COLUMN intelligenceproducttype.incoming IS '{"label": "Incoming?", "description": "Incoming?", "summaryview": "false"}';
COMMENT ON COLUMN intelligenceproducttype.outgoing IS '{"label": "Outgoing?", "description": "Outgoing?", "summaryview": "false"}';
COMMENT ON COLUMN intelligenceproducttype.outgoinganalyst IS '{"label": "Outgoing Analysist?", "description": "Outgoing Analysist?", "summaryview": "false"}';
COMMENT ON COLUMN intelligenceproducttype.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN intelligenceproducttype.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON intelligenceproducttype TO ${serviceuser};
GRANT SELECT ON intelligenceproducttype TO ${readonlyuser};
