CREATE TABLE partneremaildistribution (
  id INT4 NOT NULL PRIMARY KEY,
	email VARCHAR(80) NOT NULL,
	agency INT4,
	fpcommodity VARCHAR(80),
	policeregion VARCHAR(40),
	validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE partneremaildistribution IS '{"label": "Partner Emails", "description": "Email distribution list for external partners of the Fast Parcels capability.", "schemalastupdated": "01/10/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN partneremaildistribution.id IS '{"label": "Identifier", "businesskey": true, "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN partneremaildistribution.email IS '{"label": "Email", "description": "Email address of the POC.", "summaryview": "true"}';
COMMENT ON COLUMN partneremaildistribution.agency IS '{"label": "Partner Agency", "description": "Identifier of Partner Agency.", "summaryview": "true"}';
COMMENT ON COLUMN partneremaildistribution.fpcommodity IS '{"label": "Fast Parcel Commodity", "description": "Current commodity theme.", "summaryview": "true"}';
COMMENT ON COLUMN partneremaildistribution.policeregion IS '{"label": "Police Region", "description": "UK police region.", "summaryview": "true"}';
COMMENT ON COLUMN partneremaildistribution.validfrom IS '{"label": "Valid from date", "description": "Email valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN partneremaildistribution.validto IS '{"label": "Valid to date", "description": "Email valid to date.", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON partneremaildistribution TO ${serviceuser};
GRANT SELECT ON partneremaildistribution TO ${readonlyuser};
