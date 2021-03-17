-- missing double-quotes for true - business key
COMMENT ON COLUMN flightlookup.id IS '{"label": "Identifier", "businesskey": "true", "description": "Unique identifying column, coposed from flight number and flight time.", "summaryview": "false"}';
COMMENT ON COLUMN is81riskfactors.id IS '{"label": "Identifier", "businesskey": "true", "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN honotificationreasons.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false", "businesskey": "true"}';
COMMENT ON COLUMN tdareasons.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false", "businesskey": "true"}';
COMMENT ON COLUMN activities.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false", "businesskey": "true"}';
COMMENT ON COLUMN ferries.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false", "businesskey": "true"}';
COMMENT ON COLUMN eventclassification.id IS '{"label": "Identifier", "description": "Database unique identity record.", "businesskey": "true", "summaryview": "false"}';
