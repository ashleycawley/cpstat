#!/bin/bash

function NUMEMAIL {
cp /home/$CPUSER/.cpanel/email_accounts_count /home/$CPUSER/.cpanel/email_accounts_count_readout
echo -e $(cat /home/$CPUSER/.cpanel/email_accounts_count_readout)
rm -f /home/$CPUSER/.cpanel/email_accounts_count_readout
}

# Script

echo && read -p "User: " CPUSER

echo && echo "Scanning..." && echo

echo -e "Email Accounts: \c"
NUMEMAIL
echo

exit 0
