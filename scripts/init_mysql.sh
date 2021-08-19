#!/bin/bash

cat <<'EOF' | mysql -uroot
CREATE USER 'isucon'@'%' IDENTIFIED BY 'isucon';
GRANT ALL ON isuda.* TO 'isucon'@'%';
CREATE USER 'isucon'@'localhost' IDENTIFIED BY 'isucon';
GRANT ALL ON isuda.* TO 'isucon'@'localhost';
CREATE DATABASE isuda;
EOF
