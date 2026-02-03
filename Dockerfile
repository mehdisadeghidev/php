FROM dunglas/frankenphp:1.11-php8.5-trixie

ENV SERVER_NAME=:80

RUN apt-get update -y && \
    apt-get install -y tini && \
    rm -rf /var/lib/apt/lists/*

RUN install-php-extensions \
    pdo_pgsql \
    gd \
    intl \
    calendar \
    zip \
    bcmath \
    pcntl \
    opcache \
    sockets \
    redis \
    && rm -rf /tmp/* /var/cache/apk/* /var/lib/apt/lists/*

RUN mv $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini
COPY php.ini $PHP_INI_DIR/conf.d/99-app.ini
