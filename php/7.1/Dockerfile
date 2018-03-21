FROM php:7.1-fpm-alpine

# install dependencies
RUN apk add --no-cache \
imagemagick \
freetype-dev \
libjpeg-turbo-dev \
libpng-dev \
libmcrypt-dev \
libxml2-dev \
curl \
git \
subversion \
openssh \
openssl \
mercurial \
tini \
bash \
zlib-dev

# install, configure and enable php extensions
RUN NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
&& docker-php-ext-configure gd \
--with-gd \
--with-freetype-dir=/usr/include/ \
--with-png-dir=/usr/include/ \
--with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install -j${NPROC} mysqli zip soap iconv mcrypt gd

# clean up
RUN apk del --no-cache \
freetype-dev \
libjpeg-turbo-dev \
libpng-dev \
libxml2-dev

# add custom php settings
ADD config/custom.ini /usr/local/etc/php/conf.d/custom.ini

# install composer
ADD config/composer-installer /usr/local/bin/
RUN chmod a+x /usr/local/bin/composer-installer
RUN composer-installer

WORKDIR /usr/local/apache2/htdocs
