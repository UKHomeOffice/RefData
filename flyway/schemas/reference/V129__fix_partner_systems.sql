-- Column comments
COMMENT ON COLUMN partnersystems.shortcode IS '{"label": "Short Code", "description": "Short code of the computer system.","businesskey": "true", "summaryview": "false"}';
COMMENT ON COLUMN partnersystems.name IS '{"label": "Name", "description": "The name of the computer systems checked.", "summaryview": "true"}';

CREATE MATERIALIZED VIEW m_partnersystems AS
SELECT * FROM unit
where (validfrom <= now()::date OR validfrom is null)
AND (validto >= now()::date + interval '1d' OR validto is null);

-- Apply Grant permissions
GRANT SELECT,INSERT,UPDATE ON m_partnersystems TO ${serviceuser};
GRANT SELECT ON m_partnersystems TO ${readonlyuser};