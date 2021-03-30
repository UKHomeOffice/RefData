-- Column comments
COMMENT ON COLUMN ministry.code IS '{"label": "Code", "businesskey": "true", "description": "The code associated with the branch or region.", "summaryview": "true"}';
COMMENT ON TABLE ministry IS '{"label": "Government ministries", "owner": "cop@homeoffice.gov.uk", "description": "A list of departments, agencies and public bodies.", "schemalastupdated": "03/12/2020", "dataversion": 1}';

-- Create materialized view
CREATE MATERIALIZED VIEW m_ministry AS
    SELECT * FROM ministry
    where (validfrom <= now()::date OR validfrom is null)
      AND (validto >= now()::date + interval '1d' OR validto is null)
    WITH NO DATA;


-- Apply Grant permissions
GRANT SELECT,INSERT,UPDATE ON m_ministry TO ${serviceuser};
GRANT SELECT ON m_ministry TO ${readonlyuser};

-- Optional depending on dataset
GRANT SELECT ON m_ministry TO ${anonuser};
