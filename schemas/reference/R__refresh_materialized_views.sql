CREATE OR REPLACE PROCEDURE "refresh_materialized_views"()
AS $BODY$
begin
    REFRESH MATERIALIZED VIEW CONCURRENTLY m_unit;
    REFRESH MATERIALIZED VIEW CONCURRENTLY m_ministry;
    REFRESH MATERIALIZED VIEW CONCURRENTLY m_abusetypes;
end;$BODY$
    LANGUAGE plpgsql;

GRANT EXECUTE ON PROCEDURE refresh_materialized_views() TO ${serviceuser};
