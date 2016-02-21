## Building
Build with
```bash
docker-compose build
```

## Starting
Run with
```bash
docker-compose up
```

## Using

Exposes TYPO3 instance on ports 80 and 443 by default  
Database host is `db`  
Database user, name, password and root password are `dev`  

Go to `http://<host_ip>` to launch the setup

## Autosetup

Tested on an Amazon t2.mirco instance using "CentOS 7 (x86_64) with Updates HVM" AMI from AWS Marketplace.

-Start the instance
-Connect to it and become root
-Execute `curl https://raw.githubusercontent.com/TheMonkeyz/typo37-php7/master/autosetup_centos.sh | sh`
-Wait for the magic to do its trick
-Go to `http://<host_ip>` to launch the setup

 
