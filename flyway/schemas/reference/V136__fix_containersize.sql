-- Column comments
COMMENT ON COLUMN containersize.size IS '{"label": "Code", "businesskey": "true", "description": "The size of the container.", "summaryview": "true"}';

-- MATERIALIZED VIEW
CREATE MATERIALIZED VIEW m_containersize AS
    SELECT * FROM containersize
    where (validfrom <= now()::date OR validfrom is null)
      AND (validto >= now()::date + interval '1d' OR validto is null);

CREATE UNIQUE INDEX ON m_containersize (id);

-- Apply Grant permissions
GRANT SELECT,INSERT,UPDATE ON m_containersize TO ${serviceuser};
GRANT SELECT ON m_containersize TO ${readonlyuser};

-- Optional depending on dataset
GRANT SELECT ON m_containersize TO ${anonuser};