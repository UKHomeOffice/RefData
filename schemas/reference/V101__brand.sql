CREATE TABLE brand (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(40),
  tobaccobrand BOOL,
  alcoholbrand BOOL,
  vehiclebrand BOOL,
  iprbrand BOOL,
  goodsbrand BOOL,
  commoditybrand BOOL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE brand IS '{"label":"Brand Names", "description":"Common product brands", "schemalastupdated": "03/12/2020", "owner": "cop@homeoffice.gov.uk", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN brand.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN brand.name IS '{"label": "Brand Name", "description": "The name given to the brand.", "businesskey": true, "summaryview": "true"}';
COMMENT ON COLUMN brand.tobaccobrand IS '{"label": "Tobacco Brands", "description": "Is the brand used exclusively for Tobacco products?", "summaryview": "true"}';
COMMENT ON COLUMN brand.alcoholbrand IS '{"label": "Alcohol Brands", "description": "Is the brand used exclusively for Alcohol products?", "summaryview": "true"}';
COMMENT ON COLUMN brand.vehiclebrand IS '{"label": "Vehicle Brands", "description": "Is the brand used exclusively for Vehicle products?", "summaryview": "true"}';
COMMENT ON COLUMN brand.iprbrand IS '{"label": "IPR Brands", "description": "Is the brand used exclusively for IPR related products?", "summaryview": "true"}';
COMMENT ON COLUMN brand.goodsbrand IS '{"label": "Goods Brands", "description": "Is the brand used exclusively for Goods related products?", "summaryview": "true"}';
COMMENT ON COLUMN brand.commoditybrand IS '{"label": "Commodity Brands", "description": "Is the brand used exclusivly for Commodity related products?", "summaryview": "true"}';
COMMENT ON COLUMN brand.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN brand.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN brand.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- Grants
GRANT SELECT ON brand TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON brand TO ${serviceuser};
GRANT SELECT ON brand TO ${readonlyuser};
