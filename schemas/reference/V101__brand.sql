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
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE brand IS '{"label":"Brand Names", "description":"Common product brands", "schemalastupdated": "20/02/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN brand.id IS '{"label": "Identifier", "businesskey": true, "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN brand.name IS '{"label": "Brand Name", "description": "The name given to the brand.", "summaryview": "true"}';
COMMENT ON COLUMN brand.tobaccobrand IS '{"label": "Tobacco Brands", "description": "Is the brand used exclusively for Tobacco products?", "summaryview": "true"}';
COMMENT ON COLUMN brand.alcoholbrand IS '{"label": "Alcohol Brands", "description": "Is the brand used exclusively for Alcohol products?", "summaryview": "true"}';
COMMENT ON COLUMN brand.vehiclebrand IS '{"label": "Vehicle Brands", "description": "Is the brand used exclusively for Vehicle products?", "summaryview": "true"}';
COMMENT ON COLUMN brand.iprbrand IS '{"label": "IPR Brands", "description": "Is the brand used exclusively for IPR related products?", "summaryview": "true"}';
COMMENT ON COLUMN brand.goodsbrand IS '{"label": "Goods Brands", "description": "Is the brand used exclusively for Goods related products?", "summaryview": "true"}';
COMMENT ON COLUMN brand.commoditybrand IS '{"label": "Commodity Brands", "description": "Is the brand used exclusivly for Commodity related products?", "summaryview": "true"}';
COMMENT ON COLUMN brand.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN brand.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- Grants
GRANT SELECT ON brand TO ${anonuser};
GRANT SELECT ON brand TO ${serviceuser};
GRANT SELECT ON brand TO ${readonlyuser};
