/* Configure the root passsword */
SET @rootpassword= 'root';

/* Configure another user and a password */
SET @newuser = 'docker';
SET @newuserpassword = 'docker';

/* Set a password for root */
SET @query = CONCAT('ALTER USER "root"@"localhost" IDENTIFIED BY "', @rootpassword, '"');
PREPARE stmt FROM @query; EXECUTE stmt; DEALLOCATE PREPARE stmt;

/* Create the new user */
SET @query = CONCAT('CREATE USER "', @newuser,'"@"172.17.0.0/255.255.0.0" IDENTIFIED BY "', @newuserpassword,'" ');
PREPARE stmt FROM @query; EXECUTE stmt; DEALLOCATE PREPARE stmt;

/* Grant all privileges to the new user */
SET @query = CONCAT('GRANT ALL PRIVILEGES ON *.* TO "', @newuser, '"@"172.17.0.0/255.255.0.0" WITH GRANT OPTION');
PREPARE stmt FROM @query; EXECUTE stmt; DEALLOCATE PREPARE stmt;

FLUSH PRIVILEGES;
