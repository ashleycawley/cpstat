#!/bin/bash

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

# Script

echo && read -p "User: " CPUSER

echo && echo "Scanning..." && echo

echo -e "Email Accounts: \c"
NUMEMAIL && echo

echo -e "MySQL Databases: \c"
NUMDB && echo

read -p "Press [Enter] to see the SSL Private Key, Certificate and more..."
echo
SSLKEYS

exit 0
