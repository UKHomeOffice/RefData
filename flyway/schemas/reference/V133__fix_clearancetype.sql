-- Column comments
COMMENT ON COLUMN clearancetype.name IS '{"label": "Name", "description": "The name/Level of security clearance.", "businesskey": "true", "summaryview": "true"}';

CREATE MATERIALIZED VIEW m_clearancetype AS
SELECT * FROM clearancetype
where (validfrom <= now()::date OR validfrom is null)
AND (validto >= now()::date + interval '1d' OR validto is null);

CREATE UNIQUE INDEX ON m_clearancetype (id);

-- Apply Grant permissions
GRANT SELECT,INSERT,UPDATE ON m_clearancetype TO ${serviceuser};
GRANT SELECT ON m_clearancetype TO ${readonlyuser};

-- Optional depending on dataset
GRANT SELECT ON m_clearancetype TO ${anonuser};
