#Manual

### MySQL Config
```
CREATE SCHEMA `application` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON application.* TO 'admin'@'localhost' WITH GRANT OPTION;
```