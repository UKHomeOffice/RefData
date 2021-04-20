-- have to drop materialised view first to change col type
DROP MATERIALIZED VIEW m_clearancetype;

-- make changes
ALTER TABLE clearancetype
    ALTER code type varchar(15);

-- remake the materialized view
CREATE MATERIALIZED VIEW m_clearancetype AS
    SELECT * FROM clearancetype
    where (validfrom <= now()::date OR validfrom is null)
      AND (validto >= now()::date + interval '1d' OR validto is null);

CREATE UNIQUE INDEX ON m_clearancetype (id);

-- Apply Grant permissions
GRANT SELECT,INSERT,UPDATE ON m_clearancetype TO ${serviceuser};
GRANT SELECT ON m_clearancetype TO ${readonlyuser};
GRANT SELECT ON m_clearancetype TO ${anonuser};