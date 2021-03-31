-- Apply Grant permissions
GRANT SELECT,INSERT,UPDATE ON m_unit TO ${serviceuser};
GRANT SELECT ON m_unit TO ${readonlyuser};

-- Optional depending on dataset
GRANT SELECT ON m_unit TO ${anonuser};