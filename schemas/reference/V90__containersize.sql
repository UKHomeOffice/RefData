CREATE TABLE containersize (
  id INT4 NOT NULL PRIMARY KEY,
  size VARCHAR(60) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

 -- Table comment
COMMENT ON TABLE containersize IS '{"label": "Container Size", "description": "A data set that contains various sizes of shipping or transport container.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN containersize.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN containersize.size IS '{"label": "Code", "description": "The size of the container.", "summaryview": "true"}';
COMMENT ON COLUMN containersize.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN containersize.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

 -- GRANTs
GRANT SELECT ON containersize TO ${anonuser};
GRANT SELECT ON containersize TO ${serviceuser};
GRANT SELECT ON containersize TO ${readonlyuser};