ALTER TABLE crewrole ADD COLUMN code VARCHAR(5);

-- Column comments
COMMENT ON COLUMN crewrole.name IS '{"label": "Name", "description": "The name of the crew position.", "summaryview": "true"}';
COMMENT ON COLUMN crewrole.code IS '{"label": "Code", "description": "A code for the crew position.", "summaryview": "true", "businesskey": "true"}';

-- MATERIALIZED VIEW
CREATE MATERIALIZED VIEW m_crewrole AS
    SELECT * FROM crewrole
    where (validfrom <= now()::date OR validfrom is null)
      AND (validto >= now()::date + interval '1d' OR validto is null);

CREATE UNIQUE INDEX ON m_crewrole (id);

-- Apply Grant permissions
GRANT SELECT,INSERT,UPDATE ON m_crewrole TO ${serviceuser};
GRANT SELECT ON m_crewrole TO ${readonlyuser};

-- Optional depending on dataset
GRANT SELECT ON m_crewrole TO ${anonuser};