CREATE OR REPLACE VIEW audit AS (
  SELECT
    entity.id,
    entity.tablename,
    entity.description,
    entity.schema,
    (
      SELECT
        json_agg( changelogs.*) AS changelogs
      FROM (
        SELECT
          changelog2.id,
          changelog2.datetime,
          changelog2.changerequested,
          changelog2.requestor,
          changelog2.governancestatusid,
          changelog2.governancedate,
          changelog2.governancecomment,
          changelog2.governanceapprover,
          (
            SELECT
              json_agg( reviews.*) AS reviewers
            FROM (
              SELECT reviews1.id,
                reviews1.datetime,
                reviews1.comment,
                reviews1.email,
                reviews1.approve
              FROM (
                  reviews reviews1
              LEFT JOIN changelog changelog1 ON ((changelog1.id = reviews1.changelogid)))
              GROUP BY
                reviews1.id,
                reviews1.datetime,
                reviews1.comment,
                reviews1.email,
                reviews1.approve)
              reviews ) AS reviews
          FROM (
              changelog changelog2
          LEFT JOIN entity entity1 ON (((entity1.tablename):: text = (changelog2.tablename):: text )))
          GROUP BY
            changelog2.datetime,
            changelog2.requestor,
            changelog2.changerequested,
            changelog2.governancestatusid,
            changelog2.governancedate,
            changelog2.governancecomment,
            changelog2.governanceapprover,
            changelog2.id)
           changelogs ) AS changelogs
    FROM entity entity
  );

GRANT SELECT ON audit to ${readonlyuser};