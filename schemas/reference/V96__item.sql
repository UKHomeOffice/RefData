CREATE TABLE item (
  id INT4 NOT NULL PRIMARY KEY,
  name varchar(80) NOT NULL,
  description varchar(200),
  cites bool,
  poao bool,
  cbrn bool,
  document bool,
  tobacco bool,
  alcohol bool,
  weapons bool,
  firearms bool,
  ipr bool,
  strategic bool,
  avtc bool,
  oils bool,
  commodity bool,
  good bool,
  plant bool,
  animal bool,
  drugs bool,
  financial bool,
  indecent bool,
  vehicle bool,
  unitid int4 NOT NULL,
  seizureqty numeric(5),
  ienqty numeric(5),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

 -- Table comment
COMMENT ON TABLE item IS '{"label": "Items", "description": "Items that cross the border", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN item.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN item.name IS '{"label": "Name", "description": "Name of Item", "summaryview": "true"}';
COMMENT ON COLUMN item.description IS '{"label": "Description", "description": "Description of item", "summaryview": "true"}';
COMMENT ON COLUMN item.cites IS '{"label": "CITES", "description": "Is this a Convention on International Trade in Endangered Species of Wild Fauna and Flora Item?", "summaryview": "true"}';
COMMENT ON COLUMN item.poao IS '{"label": "POAO", "description": "Is this a Product of Animal Origin Item?", "summaryview": "true"}';
COMMENT ON COLUMN item.cbrn IS '{"label": "CBRN", "description": "Is this a Chemical, Biological, Radioactive or Nuclear Item?", "summaryview": "true"}';
COMMENT ON COLUMN item.document IS '{"label": "Document", "description": "Is this a document?", "summaryview": "true"}';
COMMENT ON COLUMN item.tobacco IS '{"label": "Tobacco", "description": "Is this tobacco?", "summaryview": "true"}';
COMMENT ON COLUMN item.alcohol IS '{"label": "Alcohol", "description": "Is this alcohol?", "summaryview": "true"}';
COMMENT ON COLUMN item.weapons IS '{"label": "Weapons", "description": "Is this a weapon?", "summaryview": "true"}';
COMMENT ON COLUMN item.firearms IS '{"label": "Firearms", "description": "Is this a firearms?", "summaryview": "true"}';
COMMENT ON COLUMN item.ipr IS '{"label": "IPR", "description": "Is this a international property rights Item?", "summaryview": "true"}';
COMMENT ON COLUMN item.strategic IS '{"label": "Strategic", "description": "Is this on the UK Strategic Export Control List?", "summaryview": "true"}';
COMMENT ON COLUMN item.oils IS '{"label": "Oils", "description": "Is this Vegetable/Petrochemical Oils?", "summaryview": "true"}';
COMMENT ON COLUMN item.commodity IS '{"label": "Commodity", "description": "Is this a commodity Item?", "summaryview": "true"}';
COMMENT ON COLUMN item.good IS '{"label": "Good", "description": "Is this a good?", "summaryview": "true"}';
COMMENT ON COLUMN item.plant IS '{"label": "Plant", "description": "Is this a Plant?", "summaryview": "true"}';
COMMENT ON COLUMN item.animal IS '{"label": "Animal", "description": "Is this a Animal?", "summaryview": "true"}';
COMMENT ON COLUMN item.drugs IS '{"label": "Drugs", "description": "Is this a Drug?", "summaryview": "true"}';
COMMENT ON COLUMN item.financial IS '{"label": "Financial", "description": "Is this a financial Item?", "summaryview": "true"}';
COMMENT ON COLUMN item.indecent IS '{"label": "Indecent", "description": "Is this Indecent or obscene material?", "summaryview": "true"}';
COMMENT ON COLUMN item.vehicle IS '{"label": "Vehicle", "description": "Is this a vehicle?", "summaryview": "true"}';
COMMENT ON COLUMN item.avtc IS '{"label": "AVTC", "description": "Is this a Alternative Value Transfer Commodities?", "summaryview": "true"}';
COMMENT ON COLUMN item.unitid IS '{"label": "Unit", "description": "Unit type of item", "summaryview": "true"}';
COMMENT ON COLUMN item.seizureqty IS '{"label": "Seizure", "description": "Minimum quantity required for seizure?", "summaryview": "true"}';
COMMENT ON COLUMN item.ienqty IS '{"label": "IEN", "description": "Minimum quantity required for seizure?", "summaryview": "true"}';
COMMENT ON COLUMN item.validfrom IS '{"label": "Valid from date", "description": "items valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN item.validto IS '{"label": "Valid to date", "description": "items valid to date.", "summaryview" : "false"}';

 -- GRANTs
GRANT SELECT ON item TO ${anonuser};
GRANT SELECT ON item TO ${serviceuser};
GRANT SELECT ON item TO ${readonlyuser};
