# helianto-spring-starter

A simple seed data service for Helianto Spring.

## Overview

Here is a sample to create a database for Helianto Spring using MySql:

```
$ mysql -u root
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2854
Server version: 5.5.50-0ubuntu0.14.04.1 (Ubuntu)

Copyright (c) 2000, 2016, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database helianto02;
Query OK, 1 row affected (0.00 sec)

mysql> grant all privileges on helianto02.* to 'helianto'@'%' identified by 'helianto';
Query OK, 0 rows affected (0.00 sec)

mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)

mysql> exit;
Bye

```

After that, you must run the ```helianto-spring-starter``` at least once.

