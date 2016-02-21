FROM php:7.0.3-apache

# Install TYPO3 dependencies
RUN apt-get update && apt-get install -y ca-certificates \
        vim \
        wget \
        curl \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        graphicsmagick \
        graphicsmagick-imagemagick-compat \
        mysql-client \
        libmemcached-dev \
        libxml2-dev \
        libldap2-dev \
        libapache2-mod-rpaf \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu \
    && docker-php-ext-install gd pdo_mysql mysqli zip ldap iconv mcrypt mbstring soap \
    
# PECL doesn't seem to work with PHP7, I haven't dug into that yet
#    && pecl install memcache \
#    && pecl install memcached \
#    && pecl install xdebug \

# Post-install cleanup
    && rm -r /var/lib/apt/lists/*

# Add customized Apache configuration and enable some mods
ADD apache2.conf /etc/apache2/apache2.conf 
RUN a2enmod rewrite                        
RUN a2enmod ssl                            

# Add PHP configuration tailored for TYPO3
ADD php.ini /usr/local/etc/php/php.ini    

# Add and run TYPO3 setup script
ADD typo3setup.sh /var/www
RUN chmod +x /var/www/typo3setup.sh
RUN /var/www/typo3setup.sh

# Add database setup script to be ran on first launch
ADD dbsetup.sh /var/www
RUN chmod +x /var/www/dbsetup.sh

# Add startup script
ADD run.sh /var/www
RUN chmod +x /var/www/run.sh

EXPOSE 80                                  
EXPOSE 443                                 

CMD ["/var/www/run.sh"]
