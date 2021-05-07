ALTER TABLE intelligenceproducttype
ADD COLUMN productclassification VARCHAR(20) NOT NULL;

-- Column comments
COMMENT ON COLUMN intelligenceproducttype.productclassification IS '{"label": "Product Classification", "description": "The MI category type of the product", "summaryview": "false"}';
