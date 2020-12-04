CREATE TABLE competence (
  id INT4 NOT NULL PRIMARY KEY,
  description TEXT NOT NULL,
  competence BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE competence IS '{"label": "Competence", "description": "A list of competence states.", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN competence.id IS '{"label": "Identifier", "businesskey": true, "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN competence.description IS '{"label": "Description", "description": "A description of the competence or impairment.", "summaryview": "true"}';
COMMENT ON COLUMN competence.competence IS '{"label": "Competence", "description": "Is the competence agreed?", "summaryview": "true"}';
COMMENT ON COLUMN competence.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN competence.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN competence.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON competence TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON competence TO ${serviceuser};
GRANT SELECT ON competence TO ${readonlyuser};
