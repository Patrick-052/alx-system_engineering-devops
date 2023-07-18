-- The user that connects to the source MySQL instance

CREATE USER 'replica_user'@'%' IDENTIFIED BY 'rep';
GRANT REPLICATION SLAVE, RELOAD, SELECT ON *.* TO 'replica_user'@'%' IDENTIFIED BY 'rep';
GRANT SELECT ON mysql.user TO 'holberton_user'@'localhost';
