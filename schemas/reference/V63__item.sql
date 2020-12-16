CREATE TABLE itemlevel1 (
  id INTEGER NOT NULL PRIMARY KEY, 
  name VARCHAR(40) NOT NULL,
  description VARCHAR(100) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

CREATE TABLE itemlevel2 (
  id INTEGER NOT NULL PRIMARY KEY, 
  name VARCHAR(40) NOT NULL,
  description VARCHAR(100) NULL,
  level1id INTEGER REFERENCES itemlevel1(id) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

CREATE TABLE itemlevel3 (
  id INTEGER NOT NULL PRIMARY KEY, 
  name VARCHAR(40) NOT NULL,
  description VARCHAR(100) NULL,
  level2id INTEGER REFERENCES itemlevel2(id) NOT NULL,
  cites BOOLEAN NOT NULL,
  poao BOOLEAN NOT NULL,
  seizure_qty NUMERIC(5,2) NULL,
  ien_qty NUMERIC(5,2) NULL,
  unitid INTEGER NOT NULL REFERENCES unit(id),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

CREATE TABLE itemlevel4 (
  id INTEGER NOT NULL PRIMARY KEY, 
  name VARCHAR(40) NOT NULL,
  description VARCHAR(100) NULL,
  level3id INTEGER REFERENCES itemlevel3(id) NOT NULL,
  controlstrategyid INTEGER NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE itemlevel1 IS '{"label": "Level 1 Items", "description": "A list of seizure or noitifying items - level 1", "schemalastupdated": "15/07/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN itemlevel1.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN itemlevel1.name IS '{"label": "Name", "description": "Level 1 Item name.", "summaryview": "false"}';
COMMENT ON COLUMN itemlevel1.description IS '{"label": "Description", "description": "Description of level 1 Item.", "summaryview": "true"}';
COMMENT ON COLUMN itemlevel1.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN itemlevel1.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- Table comment
COMMENT ON TABLE itemlevel2 IS '{"label": "Level 2 Items", "description": "A list of seizure or noitifying items - level 2", "schemalastupdated": "15/07/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN itemlevel2.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN itemlevel2.name IS '{"label": "Name", "description": "Level 2 Item name.", "summaryview": "false"}';
COMMENT ON COLUMN itemlevel2.description IS '{"label": "Description", "description": "Description of level 2 Item.", "summaryview": "true"}';
COMMENT ON COLUMN itemlevel2.level1id IS '{"label": "Level 1 ID", "description": "Link to level 1 Item list", "summaryview": "true"}';
COMMENT ON COLUMN itemlevel2.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN itemlevel2.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- Table comment
COMMENT ON TABLE itemlevel3 IS '{"label": "Level 3 Items", "description": "A list of seizure or noitifying items - level 3", "schemalastupdated": "15/07/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN itemlevel3.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN itemlevel3.name IS '{"label": "Name", "description": "Level 3 Item name.", "summaryview": "false"}';
COMMENT ON COLUMN itemlevel3.description IS '{"label": "Description", "description": "Description of level 3 Item.", "summaryview": "true"}';
COMMENT ON COLUMN itemlevel3.level2id IS '{"label": "Level 2 ID", "description": "Link to level 2 Item list.", "summaryview": "true"}';
COMMENT ON COLUMN itemlevel3.cites IS '{"label": "Is this item considered CITES", "description": "Convention on International Trade in Endangered Species of Wild Fauna and Flora.", "summaryview": "true"}';
COMMENT ON COLUMN itemlevel3.poao IS '{"label": "Is this item considered POAO", "description": "Product of Animal Origin.", "summaryview": "true"}';
COMMENT ON COLUMN itemlevel3.seizure_qty IS '{"label": "Quantity required for Seizure", "description": "Amount required to trigger seizure.", "summaryview": "true"}';
COMMENT ON COLUMN itemlevel3.ien_qty IS '{"label": "Does this require an IEN?", "description": "Quantity required to trigger an immediate event notification.", "summaryview": "true"}';
COMMENT ON COLUMN itemlevel3.unitid IS '{"label": "Unit", "description": "IEN or Seizure Unit type.", "summaryview": "true"}';
COMMENT ON COLUMN itemlevel3.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN itemlevel3.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- Table comment
COMMENT ON TABLE itemlevel4 IS '{"label": "Level 4 items", "description": "A list of seizure items - level 4", "schemalastupdated": "21/08/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN itemlevel4.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN itemlevel4.name IS '{"label": "Name", "description": "Level 4 Item name.", "summaryview": "false"}';
COMMENT ON COLUMN itemlevel4.description IS '{"label": "Description", "description": "Description of level 4 Item.", "summaryview": "true"}';
COMMENT ON COLUMN itemlevel4.level3id IS '{"label": "Level 3 ID", "description": "Link to level 3 Item list.", "summaryview": "true"}';
COMMENT ON COLUMN itemlevel4.controlstrategyid IS '{"label": "Control Strategy reference", "description": "The control strategy id associated with the item.", "":""}';
COMMENT ON COLUMN itemlevel4.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN itemlevel4.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON itemlevel1 TO ${serviceuser};
GRANT SELECT ON itemlevel1 TO ${readonlyuser};
GRANT SELECT ON itemlevel2 TO ${serviceuser};
GRANT SELECT ON itemlevel2 TO ${readonlyuser};
GRANT SELECT ON itemlevel3 TO ${serviceuser};
GRANT SELECT ON itemlevel3 TO ${readonlyuser};
GRANT SELECT ON itemlevel4 TO ${serviceuser};
GRANT SELECT ON itemlevel4 TO ${readonlyuser};