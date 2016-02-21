#!/bin/bash

# Check if we're installing TYPO3
if [ -f /var/www/html/FIRST_INSTALL ];
then
  # Start Apache
  apache2ctl start
  
  # Initiate the install process
  curl 'http://127.0.0.1/typo3/sysext/install/Start/Install.php' -H 'Pragma: no-cache' -H 'Origin: http://127.0.0.1' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-US,en;q=0.8,fr-CA;q=0.6,fr;q=0.4,fr-FR;q=0.2,en-CA;q=0.2' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: no-cache' -H 'Referer: http://127.0.0.1/typo3/sysext/install/Start/Install.php' -H 'Connection: keep-alive' --data 'install%5Baction%5D=environmentAndFolders&install%5Bset%5D=execute' --compressed
  
  # Configure the database
  sed -i "/'EXT'/i 'DB' => [\n        'database' => 'dev',\n        'host' => 'db',\n        'password' => 'dev',\n        'port' => 3306,\n        'username' => 'dev',\n    ],\n" typo3conf/LocalConfiguration.php
  
  #Stop Apache
  apache2ctl stop
  
  # We have to wait a few seconds to let Apache close its log file
  # or else the daemon won't start.  There must be a better way
  # than this to do that.
  sleep 5
fi
