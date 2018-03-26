FROM dkreemers/php-5.6

# install xdebug
RUN apk add --no-cache $PHPIZE_DEPS \
	&& pecl install xdebug-2.5.5 \
	&& docker-php-ext-enable xdebug

COPY ./config/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
