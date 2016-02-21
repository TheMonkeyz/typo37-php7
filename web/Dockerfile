FROM php:7.0.3-apache

# typo3 dependencies
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
#    && pecl install memcache \
#    && pecl install memcached \
#    && pecl install xdebug \
    && rm -r /var/lib/apt/lists/*

ADD apache2.conf /etc/apache2/apache2.conf 
RUN a2enmod rewrite                        
RUN a2enmod ssl                            
ADD php.ini /usr/local/etc/php/php.ini     
ADD typo3setup.sh /var/www
RUN chmod +x /var/www/typo3setup.sh
RUN /var/www/typo3setup.sh
ADD dbsetup.sh /var/www/dbsetup.sh
RUN chmod +x /var/www/dbsetup.sh
ADD run.sh /var/www/run.sh
RUN chmod +x /var/www/run.sh

EXPOSE 80                                  
EXPOSE 443                                 

CMD [/var/www/run.sh]
