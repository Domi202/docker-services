FROM dkreemers/php-7.3

# install xdebug
RUN apt-get install -y $PHPIZE_DEPS \
	&& pecl install xdebug-beta \
	&& docker-php-ext-enable xdebug

COPY ./config/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
