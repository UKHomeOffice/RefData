CREATE TABLE bflocationtype (
  id UUID NOT NULL PRIMARY KEY,
  seaport BOOLEAN NOT NULL,
  railterminal BOOLEAN NOT NULL,
  airport BOOLEAN NOT NULL,
  postexchange BOOLEAN NOT NULL,
  multimodal BOOLEAN NOT NULL,
  fixedtransport BOOLEAN NOT NULL,
  bordercrossing BOOLEAN NOT NULL,
  roadterminal BOOLEAN NOT NULL,
  portclassification INT2,
  description VARCHAR(60)  NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE bflocationtype IS '{"label": "Border port types", "description": "A detailed list of border port types", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN bflocationtype.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN bflocationtype.seaport IS '{"label": "Sea port", "description": "Is the location a seaport?", "summaryview": "false"}';
COMMENT ON COLUMN bflocationtype.railterminal IS '{"label": "Rail terminal", "description": "Is the location a rail terminal?", "summaryview": "false"}';
COMMENT ON COLUMN bflocationtype.airport IS '{"label": "Air port", "description": "Is the location a airport?", "summaryview": "false"}';
COMMENT ON COLUMN bflocationtype.postexchange IS '{"label": "Postal hub", "description": "Is the location a postal exchange?", "summaryview": "false"}';
COMMENT ON COLUMN bflocationtype.multimodal IS '{"label": "Mixed mode", "description": "Is the location a multi modal crossing?", "summaryview": "false"}';
COMMENT ON COLUMN bflocationtype.fixedtransport IS '{"label": "Fixed transport", "description": "Is the location a fixed transport crossing?", "summaryview": "false"}';
COMMENT ON COLUMN bflocationtype.bordercrossing IS '{"label": "Border crossing", "description": "Is the location a border crossing?", "summaryview": "false"}';
COMMENT ON COLUMN bflocationtype.roadterminal IS '{"label": "Road terminal", "description": "Is the location a road terminal?", "summaryview": "false"}';
COMMENT ON COLUMN bflocationtype.portclassification IS '{"label": "Port classification", "description": "The classification of port type.", "summaryview": "true"}';
COMMENT ON COLUMN bflocationtype.description IS '{"label": "Description", "description": "Description of port crossing.", "summaryview": "true"}';
COMMENT ON COLUMN bflocationtype.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN bflocationtype.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON bflocationtype TO ${anonuser};
GRANT SELECT ON bflocationtype TO ${serviceuser};
GRANT SELECT ON bflocationtype TO ${readonlyuser};
