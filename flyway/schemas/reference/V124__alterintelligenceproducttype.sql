ALTER TABLE intelligenceproducttype
ADD COLUMN code VARCHAR(10) NULL;

-- Column comments
COMMENT ON COLUMN intelligenceproducttype.code IS '{"label": "Code", "description": "Intelligence producttype shortcode", "summaryview": "false", "businesskey": "true"}';
COMMENT ON COLUMN intelligenceproducttype.name IS '{"label": "Name", "description": "Name of the product.", "summaryview": "true"}'
