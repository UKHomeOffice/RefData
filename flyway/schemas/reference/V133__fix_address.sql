ALTER TABLE address
ADD COLUMN code SMALLINT NULL;

-- Column comments
COMMENT ON COLUMN address.code IS '{"label": "Code", "description": "Address shortcode", "summaryview": "false", "businesskey": "true"}';
COMMENT ON COLUMN address.line1 IS '{"label": "Address line 1", "description": "First line of address.", "summaryview": "true"}';

-- MATERIALIZED VIEW
CREATE MATERIALIZED VIEW m_address AS
    SELECT * FROM address
    where (validfrom <= now()::date OR validfrom is null)
      AND (validto >= now()::date + interval '1d' OR validto is null);

CREATE UNIQUE INDEX ON m_address (id);

-- Apply Grant permissions
GRANT SELECT,INSERT,UPDATE ON m_address TO ${serviceuser};
GRANT SELECT ON m_address TO ${readonlyuser};
