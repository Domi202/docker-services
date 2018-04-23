FROM dkreemers/php-7.1

# install xdebug
RUN apt-get install -y $PHPIZE_DEPS \
	&& pecl install xdebug \
	&& docker-php-ext-enable xdebug
