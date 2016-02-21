#!/bin/bash

cd /var/www/
wget get.typo3.org/current --no-check-certificate
mkdir typo3_src
tar xzvf current -C /var/www/typo3_src --strip-components=1
cd html
ln -s ../typo3_src typo3_src
ln -s typo3_src/typo3 typo3
ln -s typo3_src/index.php index.php
touch FIRST_INSTALL
chown -R www-data.www-data ../html


