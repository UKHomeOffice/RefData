CREATE TABLE samscategories (
    id INT4 NOT NULL PRIMARY KEY, 
    category VARCHAR(75) NOT NULL,
    description VARCHAR(150),
    validfrom TIMESTAMP WITH TIME ZONE,
    validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE samscategories IS '{"label": "SAMS Categories", "description": "Categories used to specify Safeguarding and Modern Slavery cases.", "schemalastupdated": "24/10/2019", "dataversion": 1}';
-- Column comment
COMMENT ON COLUMN samscategories.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN samscategories.category IS '{"label": "Category", "description": "Title of the SAMS category.", "summaryview": "false"}';
COMMENT ON COLUMN samscategories.description IS '{"label": "Description", "description": "A short description of the SAMS category.", "summaryview": "false"}';
COMMENT ON COLUMN samscategories.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN samscategories.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';


-- GRANTs
GRANT SELECT ON samscategories TO ${anonuser};
GRANT SELECT ON samscategories TO ${serviceuser};
GRANT SELECT ON samscategories TO ${readonlyuser};
