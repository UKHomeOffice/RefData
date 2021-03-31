ALTER TABLE activities
ADD COLUMN code SMALLINT NULL;

-- Column comments
COMMENT ON COLUMN activities.code IS '{"label": "Code", "description": "activities shortcode", "summaryview": "false", "businesskey": "true"}';
COMMENT ON COLUMN activities.activity IS '{"label": "Activity", "description": "A description of the activity.", "summaryview": "true"}';

CREATE MATERIALIZED VIEW m_activities AS
SELECT * FROM activities
where (validfrom <= now()::date OR validfrom is null)
AND (validto >= now()::date + interval '1d' OR validto is null);

CREATE UNIQUE INDEX ON m_activities (id);

-- Apply Grant permissions
GRANT SELECT,INSERT,UPDATE ON m_activities TO ${serviceuser};
GRANT SELECT ON m_activities TO ${readonlyuser};