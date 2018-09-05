#!/bin/bash

function NUMEMAIL {
cat /home/$USER/.cpanel/email_accounts_count
}


# Script

read -p "User: " USER

NUMEMAIL

exit 0
