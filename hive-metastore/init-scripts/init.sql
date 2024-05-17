-- Create database
CREATE DATABASE metastore_db;

-- Create user and grant privileges
CREATE USER hive WITH PASSWORD 'datalake';
GRANT ALL PRIVILEGES ON DATABASE metastore_db TO hive;
