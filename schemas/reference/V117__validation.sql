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

-- businesskey was missing
COMMENT ON COLUMN is81riskfactors.id IS '{"label": "Identifier", "businesskey": true, "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN honotificationreasons.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false", "businesskey": true}';
COMMENT ON COLUMN tdareasons.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false", "businesskey": true}';

-- more than one businesskey, update comment to remove the rest
COMMENT ON COLUMN currency.currency IS '{"label": "Currency", "description": "The name of the currency.", "summaryview": "true"}';
COMMENT ON COLUMN department.name IS '{"label": "Department name", "description": "The name of the department.", "summaryview": "true"}';
COMMENT ON COLUMN branch.name IS '{"label": "Name", "description": "The name of the branch or region.", "summaryview": "true", "aliases": "region"}';
COMMENT ON COLUMN country.name IS '{"label": "Country name", "description": "The name of the country, territory or geographic area.", "summaryview": "true"}';
COMMENT ON COLUMN carrierlist.name IS '{"label": "Carrier name", "description": "The name of the carrier.", "summaryview": "true"}';
COMMENT ON COLUMN bflocationtype.description IS '{"label": "Description", "description": "Description of port crossing.", "summaryview": "true"}';
COMMENT ON COLUMN icao.name IS '{"label": "Name", "description": "ICAO site name", "summaryview": "true"}';
COMMENT ON COLUMN legtypes.description IS '{"label": "Description", "description": "A description of the journey type.", "summaryview": "true"}';
COMMENT ON COLUMN targetmode.mode IS '{"label": "Target mode", "description": "The targeting mode type.", "summaryview": "true"}';
COMMENT ON COLUMN unlocode.name IS '{"label": "Name", "description": "Location name", "summaryview": "true"}';
COMMENT ON COLUMN workarea.area IS '{"label": "Area", "description": "A short description of the working area.", "summaryview": "true"}';
COMMENT ON COLUMN activities.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false", "businesskey": true}';
COMMENT ON COLUMN activities.activity IS '{"label": "Activity", "description": "A description of the activity.", "summaryview": "true"}';
COMMENT ON COLUMN activities.activitytypeid IS '{"label": "Activity type ID", "description": "Link to activity type entity.", "summaryview" : "false"}';
COMMENT ON COLUMN tdacodes.name IS '{"label": "Name", "description": "The name of the governing body.", "summaryview": "true"}';
COMMENT ON COLUMN address.line1 IS '{"label": "Address line 1", "description": "First line of address.", "summaryview": "true"}';
COMMENT ON COLUMN location.name IS '{"label": "Name", "description": "Location name", "summaryview": "true"}';
COMMENT ON COLUMN technicalprojectstatus.status IS '{"label": "Status", "description": "The status of the project.", "summaryview": "true"}';
COMMENT ON COLUMN division.name IS '{"label": "Name", "description": "The division name.", "summaryview": "true"}';
COMMENT ON COLUMN command.name IS '{"label": "Name", "description": "The name of the command.", "summaryview": "true"}';
COMMENT ON COLUMN team.name IS '{"label": "Name", "description": "The name of the team.", "summaryview": "true"}';
COMMENT ON COLUMN technicalprojects.name IS '{"label": "Name", "description": "The name of the project.", "summaryview": "true"}';
COMMENT ON COLUMN ferries.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false", "businesskey": true}';
COMMENT ON COLUMN ferries.name IS '{"label": "Ferry name", "description": "The name of the ferry.", "summaryview": "true"}';
COMMENT ON COLUMN ferries.carrierid IS '{"label": "Carrier ID", "description": "Link to the carrier list table by id.", "summaryview": "true"}';
COMMENT ON COLUMN controlstrategy.strategy IS '{"label": "Strategy", "description": "The strategy descriptor.", "summaryview": "true"}';
COMMENT ON COLUMN tdareasons.reason IS '{"label": "Reason", "description": "The reason for the request.", "summaryview": "true"}';
COMMENT ON COLUMN maritimezone.name IS '{"label": "Name", "description": "The non-abbreviated name of the zone.", "summaryview": "true"}';
COMMENT ON COLUMN eventclassification.label IS '{"label": "Label", "description": "The label for the breach type", "summaryview": "true"}';
COMMENT ON COLUMN reasons.reason IS '{"label": "Description", "description": "The reason for the seizure.", "summaryview": "false"}';

-- no JSON / not a valid JSON on column
COMMENT ON COLUMN tdaapprovalstatus.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';
COMMENT ON COLUMN eventclassification.id IS '{"label": "Identifier", "description": "Database unique identity record.", "businesskey": true, "summaryview": "false"}';









