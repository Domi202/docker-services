FROM php:7.2-fpm-stretch

# install dependencies
RUN apt-get update && apt-get install -y \
wget \
imagemagick \
libfreetype6-dev \
libjpeg62-turbo-dev \
libpng-dev \
libmcrypt-dev \
libxml2-dev \
curl \
git \
subversion \
openssh-client \
openssl \
mercurial \
bash \
zlib1g-dev \
locales

# install, configure and enable php extensions
RUN locale-gen && localedef -i de_DE -f UTF-8 de_DE.UTF-8 \
&& NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
&& docker-php-ext-configure gd \
--with-gd \
--with-freetype-dir=/usr/include/ \
--with-png-dir=/usr/include/ \
--with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install -j${NPROC} mysqli calendar zip soap iconv gd

# clean up
RUN apt-get remove -y \
libfreetype6-dev \
libjpeg62-turbo-dev \
libpng-dev \
libxml2-dev \
&& apt-get autoremove -y \
&& apt-get clean

# add custom php settings
COPY config/custom.ini /usr/local/etc/php/conf.d/custom.ini

# install composer
COPY config/composer-installer /usr/local/bin/
RUN chmod a+x /usr/local/bin/composer-installer
RUN composer-installer

WORKDIR /usr/local/apache2/htdocs
