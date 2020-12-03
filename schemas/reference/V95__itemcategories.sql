CREATE TABLE itemcategories (
    id INT4 NOT NULL PRIMARY KEY,
    category VARCHAR(50) NOT NULL,
    description VARCHAR(100),
    validfrom TIMESTAMP WITH TIME ZONE,
    validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE itemcategories IS '{"label": "Item Categories", "description": "Categories used to identify items seized at the border.", "schemalastupdated": "24/10/2019", "dataversion": 1}';
-- Column comment
COMMENT ON COLUMN itemcategories.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN itemcategories.category IS '{"label": "Category", "businesskey": true, "description": "Title of the item category.", "summaryview": "false"}';
COMMENT ON COLUMN itemcategories.description IS '{"label": "Description", "description": "A short description of the item category.", "summaryview": "false"}';
COMMENT ON COLUMN itemcategories.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN itemcategories.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON itemcategories TO ${serviceuser};
GRANT SELECT ON itemcategories TO ${readonlyuser};
