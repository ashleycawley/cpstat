#!/bin/bash

function ESLEEP {
echo && sleep 1
}

function HOMEDIR {
echo -e $(cat /home/$CPUSER/.cpanel/nvdata/defaultdir)
}

function NUMEMAIL {
cp /home/$CPUSER/.cpanel/email_accounts_count /home/$CPUSER/.cpanel/email_accounts_count_readout
echo -e $(cat /home/$CPUSER/.cpanel/email_accounts_count_readout)
rm -f /home/$CPUSER/.cpanel/email_accounts_count_readout
}

function SSLKEYS {
echo -e $(cat /home/$CPUSER/.cpanel/nvdata/letsencrypt-cpanel)
}

function NUMDB {
echo -e $(cat /home/$CPUSER/.cpanel/datastore/mysql-db-count)
}

function SSHPORT {
echo -e $(cat /home/$CPUSER/.cpanel/datastore/ports_GETSSHPORT)
}

# Script

echo && read -p "User: " CPUSER

echo && echo "Scanning..." && ESLEEP

echo -e "Home Directory: \c"
HOMEDIR && ESLEEP

echo -e "Email Accounts: \c"
NUMEMAIL && ESLEEP

echo -e "MySQL Databases: \c"
NUMDB && ESLEEP

echo -e "SSH Port: \c"
SSHPORT && ESLEEP

read -p "Press [Enter] to see the SSL Private Key, Certificate and more..."
echo
SSLKEYS

exit 0
