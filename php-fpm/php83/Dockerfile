FROM sophodevops/base:latest

LABEL maintainer=<sophoniebouye@gmail.com>

# Determine arguments
ARG HOST_USER

# Install remi repo
RUN dnf install https://rpms.remirepo.net/enterprise/remi-release-9.rpm -y

# Update the system again to take latest changes
RUN dnf update -y

# Disable default PHP version enable by default in remi repo
RUN dnf module reset php

# Enable php 8.3 on remi repo
RUN dnf module install php:remi-8.3 -y

# Install PHP 8.3 and dependancies
RUN dnf install php83-php-cli \
  php83-php-fpm \
  php83-php-intl \
  php83-php-json \
  php83-php-mbstring \
  php83-php-posix \
  php83-php-pgsql \
  php83-php-curl \
  php83-php-pdo \
  php83-php-xml -y \
  && dnf clean all


# Install nodejs
RUN curl -fsSL https://rpm.nodesource.com/setup_20.x | bash - \
  && dnf install -y nsolid

# Install composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# Create PHP user
RUN groupadd php-fpm -g $HOST_USER \
  && adduser -u $HOST_USER -g php-fpm -s /bin/false php-fpm \
  && mkdir -p /run/php-fpm /var/log/php-fpm \
  && chown -R $HOST_USER:$HOST_USER /run/php-fpm /var/log/php-fpm

# Copy entrypoint file
COPY php-fpm/dockerfile-entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /var/www/html

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
