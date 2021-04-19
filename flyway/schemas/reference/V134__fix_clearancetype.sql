ALTER TABLE clearancetype
    ADD COLUMN code SMALLINT NULL;

-- Column comments
COMMENT ON COLUMN clearancetype.code IS '{"label": "Code", "description": "Clearance type shortcode", "summaryview": "false", "businesskey": "true"}';
COMMENT ON COLUMN clearancetype.name IS '{"label": "Name", "description": "The name/Level of security clearance.", "summaryview": "true"}';

-- MATERIALIZED VIEW
CREATE MATERIALIZED VIEW m_clearancetype AS
    SELECT * FROM clearancetype
    where (validfrom <= now()::date OR validfrom is null)
      AND (validto >= now()::date + interval '1d' OR validto is null);

CREATE UNIQUE INDEX ON m_clearancetype (id);

-- Apply Grant permissions
GRANT SELECT,INSERT,UPDATE ON m_clearancetype TO ${serviceuser};
GRANT SELECT ON m_clearancetype TO ${readonlyuser};
GRANT SELECT ON m_clearancetype TO ${anonuser};
