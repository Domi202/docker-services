FROM httpd:2.4

ENV WEB_DIR "Web/"

RUN apt-get update && apt-get install -y \
openssl \
openssh-client \
rsync

COPY ./config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./config/default-vhost.conf /usr/local/apache2/conf/extra/vhosts/default-vhost.conf

RUN openssl genrsa -out /etc/ssl/private/apache.key 2048
RUN openssl req -new -x509 -key /etc/ssl/private/apache.key -days 365 -sha256 -out /etc/ssl/certs/apache.crt -subj "/C=DE/ST=Bayern/L=Rosenheim/O=In2code/OU=Development/CN=local.development"
