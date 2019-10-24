CREATE TABLE reasons (
    id INT4 NOT NULL PRIMARY KEY,
    reasoncode VARCHAR(10),
    reason VARCHAR(100) NOT NULL,
    subreason BOOLEAN,
    document BOOLEAN,
    validfrom TIMESTAMP WITH TIME ZONE,
    validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE reasons IS '{"label": "Forged Document codes", "description": "Summary list of forged document codes.", "schemalastupdated": "23/10/19", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN reasons.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN reasons.reasoncode IS '{"label": "Reason code", "description": "Code identifying the reason for seizure.", "summaryview": "false"}';
COMMENT ON COLUMN reasons.reason IS '{"label": "Description", "description": "The reason for the seizure.", "summaryview": "false"}';
COMMENT ON COLUMN reasons.subreason IS '{"label": "Subform", "description": "To indicate whether this is a subcategory of a higher level reason.", "summaryview": "false"}';
COMMENT ON COLUMN reasons.document IS '{"label": "Document", "description": "To indicate whether this reason is linked to a document seizure.", "summaryview": "false"}';
COMMENT ON COLUMN reasons.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN reasons.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON reasons TO ${serviceuser};
GRANT SELECT ON reasons TO ${readonlyuser};