CREATE TABLE samssubcategory (
  id INT4 NOT NULL PRIMARY KEY,
  subcategory VARCHAR(75) NOT NULL,
  description VARCHAR(150),
  samscategoryid INT4 NOT NULL REFERENCES samscategories(id),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE samssubcategory IS '{"label": "SAMS Subcategories", "description": "Subcategories used to specify Safeguarding and Modern Slavery cases.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comment
COMMENT ON COLUMN samssubcategory.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN samssubcategory.subcategory IS '{"label": "Subcategory", "description": "The SAMS specific subcategory.", "businesskey": "true", "summaryview": "false"}';
COMMENT ON COLUMN samssubcategory.description IS '{"label": "Description", "description": "A short description of the subcategory.", "summaryview": "false"}';
COMMENT ON COLUMN samssubcategory.samscategoryid IS '{"label": "SAMS Category ID", "description": "Link to SAMS category reference data.", "summaryview": "false"}';
COMMENT ON COLUMN samssubcategory.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN samssubcategory.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN samssubcategory.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';


-- GRANTs
GRANT SELECT,INSERT,UPDATE ON samssubcategory TO ${serviceuser};
GRANT SELECT ON samssubcategory TO ${readonlyuser};
