CREATE TABLE itemcategories (
    id INT4 NOT NULL PRIMARY KEY, 
    category VARCHAR(50) NOT NULL,
    description VARCHAR(100),
    controlstrategyid INT4 NULL REFERENCES controlstrategy(id),
    validfrom TIMESTAMP WITH TIME ZONE,
    validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE itemcategories IS '{"label": "Item Categories", "description": "Categories used to identify items seized at the boarder.", "schemalastupdated": "24/10/2019", "dataversion": 1}';
-- Column comment
COMMENT ON COLUMN itemcategories.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN itemcategories.category IS '{"label": "Category", "description": "Title of the item category.", "summaryview": "false"}';
COMMENT ON COLUMN itemcategories.description IS '{"label": "Description", "description": "A short description of the item catagory.", "summaryview": "false"}';
COMMENT ON COLUMN itemcategories.controlstrategyid IS '{"label": "Control Strategy ID", "description": "Link to the Control strategy reference data.", "summaryview": "false"}';
COMMENT ON COLUMN itemcategories.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN itemcategories.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';


-- GRANTs
GRANT SELECT ON itemcategories TO ${anonuser};
GRANT SELECT ON itemcategories TO ${serviceuser};
