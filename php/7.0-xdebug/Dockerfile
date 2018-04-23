FROM dkreemers/php-7.0

# install xdebug
RUN apt-get install -y $PHPIZE_DEPS \
	&& pecl install xdebug-2.5.5 \
	&& docker-php-ext-enable xdebug
