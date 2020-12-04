CREATE TABLE containersize (
  id INT4 NOT NULL PRIMARY KEY,
  size VARCHAR(60) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

 -- Table comment
COMMENT ON TABLE containersize IS '{"label": "Container Size", "description": "A data set that contains various sizes of shipping or transport container.", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN containersize.id IS '{"label": "Identifier", "description": "Unique identifying column.", "businesskey": true, "summaryview": "false"}';
COMMENT ON COLUMN containersize.size IS '{"label": "Code", "businesskey": true, "description": "The size of the container.", "summaryview": "true"}';
COMMENT ON COLUMN containersize.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN containersize.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN containersize.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

 -- GRANTs
GRANT SELECT ON containersize TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON containersize TO ${serviceuser};
GRANT SELECT ON containersize TO ${readonlyuser};
