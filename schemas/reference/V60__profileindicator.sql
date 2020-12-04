CREATE TABLE profileindicator (
  id INT4 NOT NULL PRIMARY KEY,
  description VARCHAR(130) NOT NULL,
  ien BOOLEAN NOT NULL,
  ct BOOLEAN NOT NULL,
  person BOOLEAN NOT NULL,
  sea BOOLEAN NOT NULL,
  land BOOLEAN NOT NULL,
  rail BOOLEAN NOT NULL,
  air BOOLEAN NOT NULL,
  cash BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE profileindicator IS '{"label": "Profile Indicator", "description": "A list of reasons for conducting a search on a particular vehicle.", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN profileindicator.id IS '{"label": "Identifier", "businesskey": true, "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN profileindicator.description IS '{"label": "Indicator", "description": "Reason for selecting the vehicle to search.", "summaryview": "true"}';
COMMENT ON COLUMN profileindicator.ien IS '{"label": "IEN", "description": "For use on IEN forms.", "summaryview": "true"}';
COMMENT ON COLUMN profileindicator.ct IS '{"label": "CT", "description": "For use on CT forms.", "summaryview": "true"}';
COMMENT ON COLUMN profileindicator.person IS '{"label": "Person", "description": "Person selection tag.", "summaryview": "true"}';
COMMENT ON COLUMN profileindicator.sea IS '{"label": "Sea", "description": "Maritime selection tag.", "summaryview": "true"}';
COMMENT ON COLUMN profileindicator.land IS '{"label": "Land", "description": "Land selection tag.", "summaryview": "ture"}';
COMMENT ON COLUMN profileindicator.rail IS '{"label": "Rail", "description": "Rail selection tag.", "summaryview": "true"}';
COMMENT ON COLUMN profileindicator.air IS '{"label": "Air", "description": "Air selection tag.", "summaryview": "true"}';
COMMENT ON COLUMN profileindicator.cash IS '{"label": "Cash", "description": "For use on cash form.", "summaryview": "true"}';
COMMENT ON COLUMN profileindicator.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN profileindicator.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN profileindicator.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON profileindicator TO ${serviceuser};
GRANT SELECT ON profileindicator TO ${readonlyuser};


