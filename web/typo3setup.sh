#!/bin/bash

# Go were we'll work
cd /var/www/

# Get the latest release
wget get.typo3.org/current --no-check-certificate

# Create a folder with a know name for TYPO3 sources
mkdir typo3_src

# Extract the sources to that known directory while
# stripping the archive's first level directory
tar xzvf current -C /var/www/typo3_src --strip-components=1

# Get into the document root
cd html

# Create TYPO3's links
ln -s ../typo3_src typo3_src
ln -s typo3_src/typo3 typo3
ln -s typo3_src/index.php index.php

# Tell TYPO3 we wan't to install it
touch FIRST_INSTALL

# Copy the default .htacces file
cp typo3_src/_.htaccess .htaccess

# Change the owner to apache's user and group
chown -R www-data.www-data ../html


