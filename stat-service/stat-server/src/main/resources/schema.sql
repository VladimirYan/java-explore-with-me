CREATE TABLE IF NOT EXISTS Statistics (
    statistic_id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    app VARCHAR(100) NOT NULL,
    ip VARCHAR(15) NOT NULL,
    uri VARCHAR(100) NOT NULL,
    timestamp TIMESTAMP WITH TIME ZONE NOT NULL
);