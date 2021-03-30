ALTER TABLE abusetypes
    ADD COLUMN code VARCHAR(6) NULL;

-- Column comments
COMMENT ON COLUMN abusetypes.label IS '{"label": "Displayed label", "description": "label / description shown in data", "summaryview": "false"}';
COMMENT ON COLUMN abusetypes.code IS '{"label": "Code", "businesskey": "true", "description": "The shortcode businessKey", "summaryview": "true"}';

-- Create materialized view
CREATE MATERIALIZED VIEW m_abusetypes AS
    SELECT * FROM abusetypes
    where (validfrom <= now()::date OR validfrom is null)
      AND (validto >= now()::date + interval '1d' OR validto is null)
    WITH NO DATA;


-- Apply Grant permissions
GRANT SELECT,INSERT,UPDATE ON m_abusetypes TO ${serviceuser};
GRANT SELECT ON m_abusetypes TO ${readonlyuser};
