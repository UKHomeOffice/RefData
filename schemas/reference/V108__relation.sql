CREATE TABLE relation (
  id INTERGER NOT NULL PRIMARY KEY, 
  relation VARCHAR(20) NOT NULL, 
  description VARCHAR(100), 
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Grants
GRANT SELECT ON relation TO ${anonuser};
GRANT SELECT ON relation TO ${serviceuser};
GRANT SELECT ON relation TO ${readonlyuser};
