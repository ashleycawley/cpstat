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

# Prints All Server IP's
function ALLSVRIPS {
IPS=$(sed 's/\"//g' /home/$CPUSER/.cpanel/datastore/all_iplist.db | sed 's/[][]//g')
echo -e "$IPS"
}

# Prints cPanel user's contact email address
function CPUSRCONTACTADDRESS {
grep "@" /home/$CPUSER/.cpanel/contactinfo | sed s/\"email\":[[:space:]]//g | sed s/\'//g
}

# Prints database information extracted from Installatron directories
function INSTALLATRONDBINFO {
grep -ri "db-" /home/$CPUSER/.appdata/current/ 2>/dev/null | grep -v prefix | grep -v "db-host" | grep -v "db-type"
}

# Prints last user login information
function LASTCPLOGINS {
cat /home/$CPUSER/.lastlogin
echo
}

# Script

echo && read -p "User: " CPUSER

echo && echo "Scanning..." && ESLEEP

echo -e "Home Directory: \c" && HOMEDIR && ESLEEP

echo -e "Email Accounts: \c" && NUMEMAIL && ESLEEP

echo -e "MySQL Databases: \c" && NUMDB && ESLEEP

echo -e "SSH Port: \c" && SSHPORT && ESLEEP

echo -e "All Server IP's: \c" && ALLSVRIPS && ESLEEP

echo -e "cP User Contact Email: \c" && CPUSRCONTACTADDRESS && ESLEEP

echo "Database details extracted from Installatron:"
read -p "Press [Enter] to display..." && echo
INSTALLATRONDBINFO
echo

echo "Last cPanel Login Information:"
read -p "Press [Enter] to display..." && echo
LASTCPLOGINS
echo

read -p "Press [Enter] to see the SSL Private Key, Certificate and more..."
echo
SSLKEYS

exit 0
