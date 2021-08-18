#!/bin/bash
sudo apt install -y mysql-server mysql-client

sudo -i
cat << EOF | tee -a /etc/mysql/mysql.conf.d/mysqld.cnf
general_log = 1
general_log_file  = /var/log/mysql/mysql.log

slow_query_log = 1
long_query_time = 0
slow_query_log_file = /var/log/mysql/mysql-slow.sql

EOF

sudo systemctl enable mysql
sudo systemctl restart mysql
