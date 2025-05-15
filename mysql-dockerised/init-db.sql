-- -- Create example1 database, user, and grant privileges
-- CREATE DATABASE IF NOT EXISTS example1;
-- CREATE USER IF NOT EXISTS 'example1'@'%' IDENTIFIED BY 'example1';
-- GRANT ALL PRIVILEGES ON example1.* TO 'example1'@'%';

-- -- Create example2 database, user, and grant privileges
-- CREATE DATABASE IF NOT EXISTS example2;
-- CREATE USER IF NOT EXISTS 'example2'@'%' IDENTIFIED BY 'example2';
-- GRANT ALL PRIVILEGES ON example2.* TO 'example2'@'%';

-- -- Create example3 database, user, and grant privileges
-- CREATE DATABASE IF NOT EXISTS example3;
-- CREATE USER IF NOT EXISTS 'example3'@'%' IDENTIFIED BY 'example3';
-- GRANT ALL PRIVILEGES ON example3.* TO 'example3'@'%';

-- -- Apply changes
-- FLUSH PRIVILEGES;
-- Create databases
CREATE DATABASE IF NOT EXISTS example1;
CREATE DATABASE IF NOT EXISTS example2;
CREATE DATABASE IF NOT EXISTS example3;

-- Create users and set passwords
CREATE USER IF NOT EXISTS 'example1'@'%' IDENTIFIED BY 'example1pass';
CREATE USER IF NOT EXISTS 'example2'@'%' IDENTIFIED BY 'example2pass';
CREATE USER IF NOT EXISTS 'example3'@'%' IDENTIFIED BY 'example3pass';

-- Grant permissions
GRANT ALL PRIVILEGES ON example1.* TO 'example1'@'%';
GRANT ALL PRIVILEGES ON example2.* TO 'example2'@'%';
GRANT ALL PRIVILEGES ON example3.* TO 'example3'@'%';
FLUSH PRIVILEGES;

-- Insert into example1
USE example1;
CREATE TABLE IF NOT EXISTS core_message (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content LONGTEXT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO core_message (content) VALUES ('Hello from example1');

-- Insert into example2
USE example2;
CREATE TABLE IF NOT EXISTS core_message (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content LONGTEXT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO core_message (content) VALUES ('Hello from example2');

-- Insert into example3
USE example3;
CREATE TABLE IF NOT EXISTS core_message (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content LONGTEXT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO core_message (content) VALUES ('Hello from example3');
