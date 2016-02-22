#!/bin/bash

# Setting up the database.
/var/www/dbsetup.sh

# Trying to launch apache 30 times with a one second delay between each try
n=0
    until [ $n -ge 30 ]
        do
        apache2-foreground && break
        n=$[$n+1]
        sleep 1
   done
