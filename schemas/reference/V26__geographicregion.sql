CREATE TABLE geographicregion (
  id INT4 NOT NULL PRIMARY KEY,
  code VARCHAR(3) NULL,
  name VARCHAR(100) NOT NULL,
  iso31661alpha2 VARCHAR(10) NULL,
  countryid INTEGER NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE geographicregion IS '{"label": "Geographic regions", "description": "A list of codes and descriptions associated with geographic regions.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN geographicregion.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN geographicregion.code IS '{"label": "County code", "businesskey": "true", "description": "The international region code.", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN geographicregion.name IS '{"label": "County name", "description": "The county/region name.", "summaryview": "true", "aliases": "region"}';
COMMENT ON COLUMN geographicregion.iso31661alpha2 IS '{"label": "2 digit alpha code", "description": "The countries 2 Character alpha code.", "summaryview": "true"}';
COMMENT ON COLUMN geographicregion.countryid IS '{"label": "Linked country id", "description": "Country link to Country dataset.", "summaryview": "false"}';
COMMENT ON COLUMN geographicregion.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN geographicregion.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN geographicregion.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON geographicregion TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON geographicregion TO ${serviceuser};
GRANT SELECT ON geographicregion TO ${readonlyuser};
