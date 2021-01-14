-- not a valid JSON
COMMENT ON TABLE tdacodes IS '{"label": "Governance bodies", "description": "A list of governance bodies and their associated codes.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
COMMENT ON TABLE lasttrained IS '{"label": "Last Trained", "description": "When were you last trained periods", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
COMMENT ON TABLE traininglevels IS '{"label": "Training levels", "description": "Training levels for different courses.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
COMMENT ON TABLE covidunablereasons IS '{"label": "Covid self declaration failure reasons", "description": "Reasons why the passenger Covid self declaration was not done online before travel", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
COMMENT ON TABLE partneremaildistribution IS '{"label": "Partner Emails", "description": "Email distribution list for external partners of the Fast Parcels capability.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';

-- schemalastupdated was in a wrong format
COMMENT ON TABLE bordercrossingmode IS '{"label": "Type of Border Crossing", "description": "Methods of crossing the border", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';

-- owner missing
COMMENT ON TABLE honotificationreasons IS '{"label": "HO Notificaiton Reason", "description": "A list of reasons why a notification may be sent", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "24/11/2020", "dataversion": 1}';
COMMENT ON TABLE is81riskfactors IS '{"label": "Risk factors", "description": "Risk factors to be considered when issuing an IS81", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "24/11/2020", "dataversion": 1}';

-- businessKey should be lowercase
COMMENT ON COLUMN flightlookup.id IS '{"label": "Identifier", "businesskey": true, "description": "Unique identifying column, coposed from flight number and flight time.", "summaryview": "false"}';
