ALTER TABLE unit
ADD COLUMN code SMALLINT NULL;

-- Column comments
COMMENT ON COLUMN unit.code IS '{"label": "Code", "description": "unit shortcode", "summaryview": "false", "businesskey": "true"}';
COMMENT ON COLUMN unit.unit IS '{"label": "Unit", "description": "Type of unit", "summaryview": "false"}';

CREATE MATERIALIZED VIEW m_unit AS
SELECT * FROM unit
where (validfrom <= now()::date OR validfrom is null)
AND (validto >= now()::date + interval '1d' OR validto is null);