CREATE TABLE ben (
  id VARCHAR(20) NOT NULL PRIMARY KEY,
  test VARCHAR(10) NOT NULL,

  validfrom TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE ben IS '{{"label": "Flight Numbers", "owner": "cop@homeoffice.gov.uk", "description": "Scheduled flight numbers", "schemalastupdated": "08/01/2021", "dataversion": 1}';


-- GRANTs
GRANT SELECT,INSERT,UPDATE ON ben TO ${serviceuser};  -- we will need to delete old data often
GRANT SELECT ON ben TO ${readonlyuser};
