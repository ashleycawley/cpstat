#!/bin/bash

# This bash script is a demo of a function library that I am building
# to be able to easily obtain statstics and information about cPanel
# accounts which I will then no doubt make use of in future tools.

function ESLEEP {
echo && sleep 1
}

# Prints Home Directory
function HOMEDIR {
echo -e $(cat /home/$CPUSER/.cpanel/nvdata/defaultdir)
}

# Prints the number of email accounts
function NUMEMAIL {
echo -e $(cat /home/$CPUSER/.cpanel/email_accounts_count 2>/dev/null)
}

# Prints SSL Keys, Private, Public and more
function SSLKEYS {
echo -e $(cat /home/$CPUSER/.cpanel/nvdata/letsencrypt-cpanel)
}

# Prints the number of MySQL databases
function NUMDB {
echo -e $(cat /home/$CPUSER/.cpanel/datastore/mysql-db-count)
}

# Prints the SSH Port
function SSHPORT {
echo -e $(cat /home/$CPUSER/.cpanel/datastore/ports_GETSSHPORT)
}

# Script

echo && read -p "User: " CPUSER

echo && echo "Scanning..." && ESLEEP

echo -e "Home Directory: \c" && HOMEDIR && ESLEEP

echo -e "Email Accounts: \c" && NUMEMAIL && ESLEEP

echo -e "MySQL Databases: \c" && NUMDB && ESLEEP

echo -e "SSH Port: \c" && SSHPORT && ESLEEP

read -p "Press [Enter] to see the SSL Private Key, Certificate and more..."
echo
SSLKEYS

exit 0
