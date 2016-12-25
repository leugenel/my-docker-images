FROM busybox:latest
MAINTAINER Eugene <leugenel@gmail.com>
RUN mkdir /mysql_data && mkdir /www_data
VOLUME ["/var/lib/mysql", "/var/www/html"]
