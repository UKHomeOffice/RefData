CREATE TABLE searchtype (
  id INT4 NOT NULL PRIMARY KEY,
  type VARCHAR(50) NOT NULL,
  relevantpowerid INT4 NOT NULL REFERENCES relevantpowers(id),
  description TEXT,
  usedonobject BOOLEAN,
  usedonhuman BOOLEAN,
  searchofperson BOOLEAN,
  searchofbags BOOLEAN,
  searchofvehicle BOOLEAN,
  searchofaccfreight BOOLEAN,
  searchofunaccfreight BOOLEAN,
  searchofcontainers BOOLEAN,
  airfreight BOOLEAN,
  airpassenger BOOLEAN,
  commercialmaritime BOOLEAN,
  generalmaritime BOOLEAN,
  generalaviation BOOLEAN,
  container BOOLEAN,
  railfreight BOOLEAN,
  railpassenger BOOLEAN,
  rorofreight BOOLEAN,
  rorotourist BOOLEAN,
  cruise BOOLEAN,
  fastparcels BOOLEAN,
  post BOOLEAN,
  internationaltrade BOOLEAN,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE searchtype IS '{"label": "Search type", "description": "A list of the types of search that can be performed.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN searchtype.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.type IS '{"label": "Search type", "businesskey": true, "description": "The type of search.", "summaryview": "true"}';
COMMENT ON COLUMN searchtype.relevantpowerid IS '{"label": "Relevant Power ID", "description": "ID of the relevant power undertaking this search.", "summaryview": "true"}';
COMMENT ON COLUMN searchtype.description IS '{"label": "Description", "description": "A description of the search.", "summaryview": "true"}';
COMMENT ON COLUMN searchtype.usedonobject IS '{"label": "Used on objects", "description": "Search type used on objects.", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.usedonhuman IS '{"label": "Used on humans", "description": "Search type used on humans.", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.searchofperson IS '{"label": "Search of person", "description": "Search of a person.", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.searchofbags IS '{"label": "Search of bags", "description": "Search of a bag.", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.searchofvehicle IS '{"label": "Search of Vehicle", "description": "Search used on a vehicle.", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.searchofaccfreight IS '{"label": "Search of ACC freight", "description": "Search used on ACC freight.", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.searchofunaccfreight IS '{"label": "Search of Non-ACC freaight", "description": "Search used on Non-ACC freaight.", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.searchofcontainers IS '{"label": "Search of containers", "description": "Search used on containers.", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.airfreight IS '{"label": "Air Freight", "description": "Search technique used in Air Freight", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.airpassenger IS '{"label": "Air Passenger", "description": "Search technique used in Air Passenger", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.commercialmaritime IS '{"label": "Commercial Maritime", "description": "Search technique used in Commercial Maritime", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.generalmaritime IS '{"label": "General Maritime", "description": "Search technique used in General Maritime", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.generalaviation IS '{"label": "General Aviation", "description": "Search technique used in General Aviation", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.container IS '{"label": "Container", "description": "Search technique used in Container", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.railfreight IS '{"label": "Rail Freaight", "description": "Search technique used in Rail Freight", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.railpassenger IS '{"label": "Rail Passenger", "description": "Search technique used in Rail Passenger", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.rorofreight IS '{"label": "RoRo Freight", "description": "Search technique used in RoRo Freight", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.rorotourist IS '{"label": "RoRo Tourist", "description": "Search technique used in RoRo Tourist", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.cruise IS '{"label": "Cruise", "description": "Search technique used in Cruise", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.fastparcels IS '{"label": "Fast Parcels", "description": "Search technique used in Fast Parcels", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.post IS '{"label": "Post", "description": "Search technique used in Post", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.internationaltrade IS '{"label": "International Trade", "description": "Search technique used in International Trade", "summaryview": "false"}';
COMMENT ON COLUMN searchtype.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN searchtype.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON searchtype TO ${serviceuser};
GRANT SELECT ON searchtype TO ${readonlyuser};
