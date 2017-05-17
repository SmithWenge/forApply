#Manual

### MySQL Config
```
CREATE SCHEMA `application` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
CREATE USER 'apply'@'localhost' IDENTIFIED BY 'apply';
GRANT ALL PRIVILEGES ON application.* TO 'apply'@'localhost' WITH GRANT OPTION;
```
### admin login
```
localhost:8080/apply/admin/routeLogin.action
```
### redict
```
localhost:8080/apply
```