CREATE TABLE modetypes (
  id INT4 NOT NULL PRIMARY KEY,
  class VARCHAR(60) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE modetypes IS '{"description": "Class of transport", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN modetypes.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN modetypes.class IS '{"label": "Class", "description": "Type of transport class", "summaryview": "true"}';
COMMENT ON COLUMN modetypes.validfrom IS '{"label": "Valid from date", "description": "Item valid from date", "summaryview" : "false"}';
COMMENT ON COLUMN modetypes.validto IS '{"label": "Valid to date", "description": "Item valid to date", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON modetypes TO ${anonuser};
GRANT SELECT ON modetypes TO ${serviceuser};
GRANT SELECT ON modetypes TO ${readonlyuser};
