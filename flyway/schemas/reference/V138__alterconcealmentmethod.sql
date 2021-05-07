ALTER TABLE concealmentmethod
ADD COLUMN uofsituation BOOLEAN NULL,

-- Column comments
COMMENT ON COLUMN concealmentmethod.uofsituation IS '{"label": "Use of Force situation", "description": "Is this concealment method applicable to a Use Of Force event", "summaryview": "false"}';
