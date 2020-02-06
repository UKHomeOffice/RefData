CREATE OR REPLACE VIEW viewhostructure AS
    SELECT
      team.id AS teamid,
      team.NAME as teamname,
      team.code AS teamcode,   
      command.id AS commandid,
      command.NAME AS commandname,
      command.code AS commandcode,
      division.id AS divisionid,
      division.code AS divisioncode,
      division.NAME AS divisionname,
      branch.id AS branchid,
      branch.code AS branchcode,
      branch.NAME AS branchname,
      directorate.id AS directorateid,
      directorate.code AS directoratecode,
      directorate.NAME AS directoratename,
      department.id AS departmentid,
      department.code AS departmentcode,
      department.NAME AS departmentname,
      ministry.id AS ministryid,
      ministry.code AS ministrycode,
      ministry.NAME AS ministryname
    FROM
      team
      LEFT JOIN command ON team.commandid = command.id
      LEFT JOIN division ON team.divisionid = division.id
      LEFT JOIN branch ON team.branchid = branch.id
      LEFT JOIN directorate ON team.directorateid = directorate.id
      LEFT JOIN department ON team.departmentid = department.id
      LEFT JOIN ministry ON team.ministryid = ministry.id;


-- GRANTs
GRANT SELECT ON viewhostructure TO ${serviceuser};
GRANT SELECT ON viewhostructure TO ${readonlyuser};


-- Table comment
COMMENT ON VIEW viewhostructure IS '{"label": "Home Office Structure", "description": "Full structure of the Home Office", "schemalastupdated": "05/12/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN viewhostructure.ministryid IS '{"label": "Ministry ID", "description": "Ministry ID.", "summaryview": "false"}';
COMMENT ON COLUMN viewhostructure.ministrycode IS '{"label": "Ministry Code", "description": "Ministry Short Code", "summaryview": "false"}';
COMMENT ON COLUMN viewhostructure.ministryname IS '{"label": "Ministry Name", "description": "The name of the ministry", "summaryview": "true"}';
COMMENT ON COLUMN viewhostructure.departmentid IS '{"label": "Department ID", "description": "Department ID.", "summaryview": "false"}';
COMMENT ON COLUMN viewhostructure.departmentcode IS '{"label": "Department Code", "description": "Department Short Code", "summaryview": "false"}';
COMMENT ON COLUMN viewhostructure.departmentname IS '{"label": "Department Name", "description": "The name of the Department", "summaryview": "true"}';
COMMENT ON COLUMN viewhostructure.directorateid IS '{"label": "Directorate ID", "description": "Directorate ID.", "summaryview": "false"}';
COMMENT ON COLUMN viewhostructure.directoratecode IS '{"label": "Directorate Code", "description": "Directorate Short Code", "summaryview": "false"}';
COMMENT ON COLUMN viewhostructure.directoratename IS '{"label": "Directorate Name", "description": "The name of the Directorate", "summaryview": "true"}';
COMMENT ON COLUMN viewhostructure.branchid IS '{"label": "Branch ID", "description": "Branch ID.", "summaryview": "false"}';
COMMENT ON COLUMN viewhostructure.branchcode IS '{"label": "Branch Code", "description": "Branch Short Code", "summaryview": "false"}';
COMMENT ON COLUMN viewhostructure.branchname IS '{"label": "Branch Name", "description": "The name of the Branch", "summaryview": "true"}';
COMMENT ON COLUMN viewhostructure.divisionid IS '{"label": "Division ID", "description": "Division ID.", "summaryview": "false"}';
COMMENT ON COLUMN viewhostructure.divisioncode IS '{"label": "Division Code", "description": "Division Short Code", "summaryview": "false"}';
COMMENT ON COLUMN viewhostructure.divisionname IS '{"label": "Division Name", "description": "The name of the Division", "summaryview": "true"}';
COMMENT ON COLUMN viewhostructure.commandid IS '{"label": "Command ID", "description": "Command ID.", "summaryview": "false"}';
COMMENT ON COLUMN viewhostructure.commandcode IS '{"label": "Command Code", "description": "Command Short Code", "summaryview": "false"}';
COMMENT ON COLUMN viewhostructure.commandname IS '{"label": "Command Name", "description": "The name of the Command", "summaryview": "true"}';
COMMENT ON COLUMN viewhostructure.teamid IS '{"label": "Team ID", "description": "Team ID.", "summaryview": "false"}';
COMMENT ON COLUMN viewhostructure.teamcode IS '{"label": "Team Code", "description": "Team Short Code", "summaryview": "false"}';
COMMENT ON COLUMN viewhostructure.teamname IS '{"label": "Team Name", "description": "The name of the Team", "summaryview": "true"}';
