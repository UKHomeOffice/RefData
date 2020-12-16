CREATE TABLE grade (
  id UUID NOT NULL PRIMARY KEY,
  name VARCHAR(60) NOT NULL,
  parentgradetypeid UUID REFERENCES grade(id),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE grade IS '{"label": "Civil service grades", "description": "A list of civil service grade codes.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN grade.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN grade.name IS '{"label": "Grade code", "description": "The civil service grade code.", "summaryview": "true"}';
COMMENT ON COLUMN grade.parentgradetypeid IS '{"label": "Parent grade ID", "description": "Link to parent grade.", "summaryview" : "false"}';
COMMENT ON COLUMN grade.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN grade.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON grade TO ${anonuser};
GRANT SELECT ON grade TO ${serviceuser};
GRANT SELECT ON grade TO ${readonlyuser};
