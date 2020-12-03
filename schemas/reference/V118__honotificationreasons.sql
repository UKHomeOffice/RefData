CREATE TABLE honotificationreasons (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(100) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE honotificationreasons IS '{"label": "HO Notificaiton Reason", "description": "A list of reasons why a notification may be sent", "schemalastupdated": "24/11/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN honotificationreasons.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN honotificationreasons.name IS '{"label": "Name", "description": "Name of the notification", "summaryview": "true"}';
COMMENT ON COLUMN honotificationreasons.description IS '{"label": "Description", "description": "Description of the notification", "summaryview": "true"}';
COMMENT ON COLUMN honotificationreasons.validfrom IS '{"label": "Valid from date", "description": "Hit reason valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN honotificationreasons.validto IS '{"label": "Valid to date", "description": "Hit reason valid to date.", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON honotificationreasons TO ${serviceuser};
GRANT SELECT ON honotificationreasons TO ${readonlyuser};
