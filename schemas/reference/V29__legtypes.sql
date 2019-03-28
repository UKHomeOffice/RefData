CREATE TABLE legtypes (
  id int4 NOT NULL PRIMARY KEY,
  description varchar(60) NOT NULL
);

-- GRANTs
GRANT SELECT ON legtypes TO ${anonuser};
GRANT SELECT ON legtypes TO ${serviceuser};
GRANT SELECT ON legtypes TO ${readonlyuser};

COMMENT ON TABLE legtypes IS '{"description": "Mode of leg journey", "schemalastupdated": "06/03/2019", "dataversion": 1}';
COMMENT ON COLUMN legtypes.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN legtypes.description IS '{"label": "Description", "description": "Description of journey type", "summaryview": "true"}';