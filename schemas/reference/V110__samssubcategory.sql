CREATE TABLE samssubcategory (
    id INT4 NOT NULL PRIMARY KEY, 
    subcategory VARCHAR(75) NOT NULL,
    description VARCHAR(150),
    samscategoryid INT4 NOT NULL REFERENCES samscategories(id),
    validfrom TIMESTAMP WITH TIME ZONE,
    validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE samssubcategory IS '{"label": "SAMS Subcategories", "description": "Subcategories used to specify Safeguarding and Modern Slavery cases.", "schemalastupdated": "24/10/2019", "dataversion": 1}';
-- Column comment
COMMENT ON COLUMN samssubcategory.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN samssubcategory.subcategory IS '{"label": "Subcategory", "description": "The SAMS specific subcategory.", "summaryview": "false"}';
COMMENT ON COLUMN samssubcategory.description IS '{"label": "Description", "description": "A short description of the subcategory.", "summaryview": "false"}';
COMMENT ON COLUMN samssubcategory.samscategoryid IS '{"label": "SAMS Category ID", "description": "Link to SAMS category reference data.", "summaryview": "false"}';
COMMENT ON COLUMN samssubcategory.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN samssubcategory.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';


-- GRANTs
GRANT SELECT ON samssubcategory TO ${anonuser};
GRANT SELECT ON samssubcategory TO ${serviceuser};
GRANT SELECT ON samssubcategory TO ${readonlyuser};
