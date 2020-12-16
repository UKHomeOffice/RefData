CREATE TABLE criminalrecordtype (
  id INT4 NOT NULL PRIMARY KEY,
  recordname VARCHAR(20) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE criminalrecordtype IS '{"label": "Criminal record", "description": "Criminal record type and description.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN criminalrecordtype.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN criminalrecordtype.recordname IS '{"label": "Record name", "description": "Record category", "summaryview": "true"}';
COMMENT ON COLUMN criminalrecordtype.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN criminalrecordtype.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON criminalrecordtype TO ${anonuser};
GRANT SELECT ON criminalrecordtype TO ${serviceuser};
GRANT SELECT ON criminalrecordtype TO ${readonlyuser};
