.PHONY: php55 php56 php70 php71 php72 php73

php55:
	docker build -t dkreemers/php-5.6:latest php/5.5
	docker run -it --rm dkreemers/php-5.5:latest bash -c "php -v && composer -v"

php56:
	docker build -t dkreemers/php-5.6:latest php/5.6
	docker run -it --rm dkreemers/php-5.6:latest bash -c "php -v && composer -v"

php70:
	docker build -t dkreemers/php-7.0:latest php/7.0
	docker run -it --rm dkreemers/php-7.0:latest bash -c "php -v && composer -v"

php71:
	docker build -t dkreemers/php-7.1:latest php/7.1
	docker run -it --rm dkreemers/php-7.1:latest bash -c "php -v && composer -v"

php72:
	docker build -t dkreemers/php-7.2:latest php/7.2
	docker run -it --rm dkreemers/php-7.2:latest bash -c "php -v && composer -v"

php73:
	docker build -t dkreemers/php-7.3:latest php/7.3
	docker run -it --rm dkreemers/php-7.3:latest bash -c "php -v && composer -v"

.PHONY: php56-xdebug php70-xdebug php71-xdebug php72-xdebug php73-xdebug

php56-xdebug:
	docker build -t dkreemers/php-5.6-xdebug:latest php/5.6-xdebug
	docker run -it --rm dkreemers/php-5.6-xdebug:latest bash -c "php -v && composer -v"

php70-xdebug:
	docker build -t dkreemers/php-7.0-xdebug:latest php/7.0-xdebug
	docker run -it --rm dkreemers/php-7.0-xdebug:latest bash -c "php -v && composer -v"

php71-xdebug:
	docker build -t dkreemers/php-7.1-xdebug:latest php/7.1-xdebug
	docker run -it --rm dkreemers/php-7.1-xdebug:latest bash -c "php -v && composer -v"

php72-xdebug:
	docker build -t dkreemers/php-7.2-xdebug:latest php/7.2-xdebug
	docker run -it --rm dkreemers/php-7.2-xdebug:latest bash -c "php -v && composer -v"

php73-xdebug:
	docker build -t dkreemers/php-7.3-xdebug:latest php/7.3-xdebug
	docker run -it --rm dkreemers/php-7.3-xdebug:latest bash -c "php -v && composer -v"

test: php56 php70 php71 php72 php73 php56-xdebug php70-xdebug php71-xdebug php72-xdebug php73-xdebug
