CREATE TABLE ouiandaddress (
  id INT4 NOT NULL PRIMARY KEY,
  oui VARCHAR(6) NOT NULL,
  organization_name VARCHAR(250) NOT NULL,
  organization_address VARCHAR(550) NOT NULL,
  ouigroup_name VARCHAR(250) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE ouiandaddress IS '{"label": "OUI and Address", "owner": "mark@digitalpatterns.io", "description": "OUI assignments", "schemalastupdated": "18/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN ouiandaddress.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN ouiandaddress.oui IS '{"label": "OUI", "description": "Ieee Assignment", "summaryview": "true"}';
COMMENT ON COLUMN ouiandaddress.organization_name IS '{"label": "Description", "description": "Name of the registered organization", "summaryview": "true"}';
COMMENT ON COLUMN ouiandaddress.organization_address IS '{"label": "Description", "description": "Address of the registered organization", "summaryview": "true"}';
COMMENT ON COLUMN ouiandaddress.ouigroup_name IS '{"label": "Description", "description": "Group name of the registered organization", "summaryview": "true"}';
COMMENT ON COLUMN ouiandaddress.validfrom IS '{"label": "Valid from date", "description": "Risk valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN ouiandaddress.validto IS '{"label": "Valid to date", "description": "Risk valid to date.", "summaryview": "false"}';
COMMENT ON COLUMN ouiandaddress.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON ouiandaddress TO ${serviceuser};
GRANT SELECT ON ouiandaddress TO ${readonlyuser};
GRANT SELECT ON ouiandaddress TO ${readonlyuser};
