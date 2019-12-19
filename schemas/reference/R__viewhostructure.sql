CREATE OR REPLACE VIEW viewhostructure AS
    SELECT
   ministry.id AS ministryid,
   ministry.code AS ministrycode,
   ministry.NAME AS ministryname,
   department.id AS departmentid,
   department.code AS departmentcode,
   department.NAME AS departmentname,
   directorate.id AS directorateid,
   directorate.code AS directoratecode,
   directorate.NAME AS directoratename,
   branch.id AS branchid,
   branch.code AS branchcode,
   branch.NAME AS branchname,
   division.id AS divisionid,
   division.code AS divisioncode,
   division.NAME AS divisionname,
   command.id AS commandid,
   command.code AS commandcode,
   command.NAME AS commandname,
   team.id AS teamid,
   team.code AS teamcode,
   team.NAME AS teamname
FROM
   ministry
       FULL OUTER JOIN department ON department.ministryid = ministry.id
       FULL OUTER JOIN directorate ON directorate.departmentid = department.id
       FULL OUTER JOIN branch ON branch.directorateid = directorate.id
       FULL OUTER JOIN division ON division.branchid = branch.id
       FULL OUTER JOIN command ON command.divisionid = division.id
       LEFT JOIN team ON team.commandid = command.ID
       OR ( team.divisionid = division.id AND team.commandid IS NULL )
       OR ( team.branchid = branch.id AND team.divisionid IS NULL )
       OR ( team.directorateid = directorate.id AND team.branchid IS NULL )
       OR ( team.departmentid = department.id AND team.directorateid IS NULL )
       OR ( team.ministryid = ministry.id AND team.departmentid IS NULL );
