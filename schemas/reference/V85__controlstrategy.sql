CREATE TABLE controlstrategy (
  id int4 NOT NULL PRIMARY KEY,
  strategy VARCHAR(60) NOT NULL,
  priority VARCHAR(1) NOT NULL,
  code VARCHAR(10) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE controlstrategy IS '{"label": "Control strategy", "description": "Details of the control strategy as set by Border Force.", "schemalastupdated": "21/08/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN controlstrategy.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN controlstrategy.strategy IS '{"label": "Strategy", "description": "The strategy descriptor.", "summaryview": "true"}';
COMMENT ON COLUMN controlstrategy.priority IS '{"label": "Priority", "description": "The priority letter assigned to the strategy.", "summaryview": "true"}';
COMMENT ON COLUMN controlstrategy.code IS '{"label": "Code", "businesskey": true, "description": "Control Strategy Code.", "summaryview": "true"}';
COMMENT ON COLUMN controlstrategy.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN controlstrategy.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON controlstrategy TO ${serviceuser};
GRANT SELECT ON controlstrategy TO ${readonlyuser};
