FROM dkreemers/php:7.1

RUN apt-get update \
	&& apt-get install -y libldap2-dev \
	&& docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
	&& docker-php-ext-install ldap
