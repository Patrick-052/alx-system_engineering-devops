-- Base Database and table to be replicated

CREATE DATABASE tyrell_corp;
USE tyrell_corp;
CREATE TABLE nexus6 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);
INSERT INTO nexus6 (name) VALUES ('malcom');
SELECT * FROM nexus6;
GRANT SELECT ON tyrell_corp.* TO 'holberton_user'@'localhost';
