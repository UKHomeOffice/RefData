CREATE TABLE samscategories (
  id INT4 NOT NULL PRIMARY KEY,
  category VARCHAR(75) NOT NULL,
  description VARCHAR(150),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE samscategories IS '{"label": "SAMS Categories", "description": "Categories used to specify Safeguarding and Modern Slavery cases.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comment
COMMENT ON COLUMN samscategories.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN samscategories.category IS '{"label": "Category", "description": "Title of the SAMS category.", "businesskey": "true", "summaryview": "false"}';
COMMENT ON COLUMN samscategories.description IS '{"label": "Description", "description": "A short description of the SAMS category.", "summaryview": "false"}';
COMMENT ON COLUMN samscategories.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN samscategories.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN samscategories.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';


-- GRANTs
GRANT SELECT,INSERT,UPDATE ON samscategories TO ${serviceuser};
GRANT SELECT ON samscategories TO ${readonlyuser};
