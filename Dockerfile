FROM php:alpine
MAINTAINER Will Hall "will@willhallonline.co.uk"

LABEL io.whalebrew.config.working_dir '/app'
LABEL io.whalebrew.name composer

# Update image
RUN apk update

# Install Dependencies
RUN apk add --no-cache --virtual .persistent-deps \
    zip \
    unzip \
    git \
    patch

# Remove memory limit for PHP-CLI and set timezone
RUN echo "memory_limit = -1" > /usr/local/etc/php/conf.d/memory-limit.ini
RUN echo "date.timezone = UTC" >> /usr/local/etc/php/conf.d/date-timezone.ini

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/bin/composer
RUN chmod +x /usr/bin/composer

# Allow Composer to be run as root and set $PATH for Composer Executables
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV PATH "$PATH:/root/.composer/vendor/bin"

WORKDIR /app

CMD ["composer"]
