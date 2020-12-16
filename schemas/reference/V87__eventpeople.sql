ALTER TABLE eventpeopletype
  ADD COLUMN person BOOLEAN NOT NULL,
  ADD COLUMN organization BOOLEAN NOT NULL;

COMMENT ON COLUMN eventpeopletype.person IS '{"label": "Person type", "description": "Can be used to describe a person at an event.", "summaryview": "true"}';
COMMENT ON COLUMN eventpeopletype.organization IS '{"label": "Organization type", "description": "Can be used to describe a organization at an event.", "summaryview": "true"}';