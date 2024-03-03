FROM ubuntu:22.04

WORKDIR /var/www/html

RUN apt update && apt install -y ca-certificates apt-transport-https software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt update

RUN apt install -y nginx

RUN apt install -y php8.2-fpm php8.2-curl php8.2-mysql php8.2-mbstring

RUN apt install -y curl vim

COPY nginx.conf /etc/nginx/sites-available/default

COPY src ./src

#RUN chown -R www-data:www-data /var/www/html/src

COPY entrypoint.sh .

CMD ["bash", "entrypoint.sh"]
