FROM php:7.2-apache

LABEL maintainer="will@willhallonline.co.uk" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.name="willhallonline/composer" \
    org.label-schema.description="Composer inside Docker" \
    org.label-schema.url="https://github.com/willhallonline/docker-composer" \
    org.label-schema.vcs-url="https://github.com/willhallonline/docker-composer" \
    org.label-schema.vendor="Will Hall Online" \
    org.label-schema.docker.cmd="docker run --rm -it -v $(pwd):/app willhallonline/composer:7.2-apache"

# Install Dependencies
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    git \
    patch \
    libpng-dev \
    --no-install-recommends && rm -r /var/lib/apt/lists/* && \
    docker-php-ext-install gd

# Remove memory limit for PHP-CLI and set timezone
RUN echo "memory_limit = -1" > /usr/local/etc/php/conf.d/memory-limit.ini \
    && echo "date.timezone = UTC" >> /usr/local/etc/php/conf.d/date-timezone.ini

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/bin/composer \
    && chmod +x /usr/bin/composer

# Allow Composer to be run as root and set $PATH for Composer Executables
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV PATH "$PATH:/root/.composer/vendor/bin"

WORKDIR /app

CMD ["composer"]
