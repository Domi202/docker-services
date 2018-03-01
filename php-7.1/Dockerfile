FROM php:7.1-fpm-alpine

ENV COMPOSER_ALLOW_SUPERUSER 0
ENV COMPOSER_HOME /tmp
ENV COMPOSER_VERSION 1.6.3

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
RUN curl -s -f -L -o /tmp/installer.php https://raw.githubusercontent.com/composer/getcomposer.org/b107d959a5924af895807021fcef4ffec5a76aa9/web/installer \
 && php -r " \
    \$signature = '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061'; \
    \$hash = hash('SHA384', file_get_contents('/tmp/installer.php')); \
    if (!hash_equals(\$signature, \$hash)) { \
        unlink('/tmp/installer.php'); \
        echo 'Integrity check failed, installer is either corrupt or worse.' . PHP_EOL; \
        exit(1); \
    }" \
 && php /tmp/installer.php --no-ansi --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION} \
 && composer --ansi --version --no-interaction \
 && rm -rf /tmp/* /tmp/.htaccess

WORKDIR /usr/local/apache2/htdocs
