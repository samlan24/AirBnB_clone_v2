--script that creates a new database, a new user
--and grants priviliges

CREATE DATABASE IF NOT EXISTS hbnb_dev_db;
--creating a new database
CREATE USER IF NOT EXISTS 'hbnb_dev'@l'localhost' IDENTIFIED BY 'hbnb_dev_pwd';
--creating a new user
GRANT ALL PRIVILEGES ON hbnb_dev_db.* TO 'hbnb_dev'@'localhost';
--granting all privileges
FLUSH PRIVILEGES;
GRANT SELECT ON performance_schema.* TO 'hbnb_dev'@'localhost';
--granting select privilege
FLUSH PRIVILEGES;
