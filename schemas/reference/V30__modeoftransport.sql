CREATE TABLE modeoftransport (
  id INT4 NOT NULL PRIMARY KEY,
  type VARCHAR(30) NOT NULL,
  ien BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE modeoftransport IS '{"label": "Mode of transportation", "description": "A list detailing modes of transport.", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN modeoftransport.id IS '{"label": "Identifier", "description": "Unique identifying column.", businesskey": true, "summaryview": "false"}';
COMMENT ON COLUMN modeoftransport.type IS '{"label": "Type", "businesskey": true, "description": "Types of transport.", "summaryview": "true"}';
COMMENT ON COLUMN modeoftransport.ien IS '{"label": "IEN", "description": "Applicable to the IEN forms", "summaryview": "true"}';
COMMENT ON COLUMN modeoftransport.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN modeoftransport.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN modeoftransport.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON modeoftransport TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON modeoftransport TO ${serviceuser};
GRANT SELECT ON modeoftransport TO ${readonlyuser};
