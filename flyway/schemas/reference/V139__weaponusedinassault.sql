CREATE TABLE weaponusedinassault (
  id INTEGER NOT NULL PRIMARY KEY,
  code INTEGER NOT NULL,
  weaponname VARCHAR(80) NULL
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE weaponusedinassault IS '{"label":"Weapon used in assault names", "description":"Common types of weapons used in an assault situation", "schemalastupdated": "07/05/2021", "owner": "cop@homeoffice.gov.uk", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN weaponusedinassault.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN weaponusedinassault.code IS '{"label": "code", "description": "The business key of the weapon", "businesskey": "true", "summaryview": "false"}';
COMMENT ON COLUMN weaponusedinassault.weaponname IS '{"label": "Weapon name", "description": "Name of the weapon", "summaryview": "true"}';
COMMENT ON COLUMN weaponusedinassault.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN weaponusedinassault.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN weaponusedinassault.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- Grants
GRANT SELECT ON weaponusedinassault TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON weaponusedinassault TO ${serviceuser};
GRANT SELECT ON weaponusedinassault TO ${readonlyuser};
