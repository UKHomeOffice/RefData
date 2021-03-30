CREATE OR REPLACE PROCEDURE "refresh_materialized_views"()
AS $BODY$
begin
    REFRESH MATERIALIZED VIEW CONCURRENTLY m_ministry;
end;$BODY$
    LANGUAGE plpgsql
