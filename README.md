#Manual

### MySQL Config
CREATE SCHEMA `application` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
CREATE USER 'apply'@'localhost' IDENTIFIED BY 'apply';
GRANT ALL PRIVILEGES ON application.* TO 'apply'@'localhost' WITH GRANT OPTION;

### admin login
http://m.caifengfinance.com/apply/admin/routeLogin.action

### redict
http://m.caifengfinance.com/apply

### base environment
jdk 1.7
tomcat 8.0
mysql 5.7
