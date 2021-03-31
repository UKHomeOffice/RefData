ALTER TABLE activitytype
ADD COLUMN code SMALLINT NULL;

-- Column comments
COMMENT ON COLUMN activitytype.code IS '{"label": "Code", "description": "activity type shortcode", "summaryview": "false", "businesskey": "true"}';
COMMENT ON COLUMN activitytype.type IS '{"label": "Activity type", "description": "Description of the activity type.", "summaryview": "true"}';

CREATE MATERIALIZED VIEW m_activitytype AS
SELECT * FROM activitytype
where (validfrom <= now()::date OR validfrom is null)
AND (validto >= now()::date + interval '1d' OR validto is null);

CREATE UNIQUE INDEX ON m_activitytype (id);

-- Apply Grant permissions
GRANT SELECT,INSERT,UPDATE ON m_activitytype TO ${serviceuser};
GRANT SELECT ON m_activitytype TO ${readonlyuser};