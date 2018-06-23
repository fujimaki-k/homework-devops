#!/bin/sh
# -*- coding: utf-8 -*-

# vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4:



# root user password
if [ -z $MYSQL_ROOT_PASSWORD ]; then
    MYSQL_ROOT_PASSWORD=password
fi


# Database directory
if [ ! -d /var/lib/mysql ]; then
    mkdir /var/lib/mysql
fi

# Logs directory
if [ ! -d /var/log/mysql ]; then
    mkdir /var/log/mysql
fi

# Run directory
if [ ! -d /run/mysqld ]; then
    mkdir /run/mysqld
fi

# Setup mysql
chown -R mysql:mysql /var/lib/mysql
chown -R mysql:mysql /var/log/mysql
chown -R mysql:mysql /run/mysqld
if [ -n `ls /var/lib/mysql` ]; then
    /usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

su -s /bin/sh -c "/usr/bin/mysqld_safe & sleep 1" mysql
echo "GRANT ALL PRIVILEGES ON *.* TO root@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;" | /usr/bin/mysql -u root
/usr/bin/mysql -u root < /etc/mysql/init.sql
/usr/bin/mysqladmin --user root password $MYSQL_ROOT_PASSWORD
/usr/bin/mysqladmin --user root --password=$MYSQL_ROOT_PASSWORD shutdown

su -s /bin/sh -c "/usr/bin/mysqld_safe" mysql



# Local variables:
# tab-width: 4
# c-basic-offset: 4
# c-hanging-comment-ender-p: nil
# End:

