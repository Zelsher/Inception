# Utilisation d'une image PHP-FPM stable basée sur Alpine
FROM php:8.2-fpm-alpine

# Installation des extensions PHP nécessaires à WordPress
RUN apk add --no-cache \
    mariadb-client \
    libpng-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    freetype-dev \
    oniguruma-dev \
    libxml2-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install gd mysqli pdo pdo_mysql mbstring xml

# Installation de WP-CLI (outil en ligne de commande pour WordPress)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Définition du répertoire de travail
WORKDIR /var/www/html

# Copie du script d’installation de WordPress
COPY tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Exposition du port PHP-FPM
EXPOSE 9000

# Lancement du script au démarrage
ENTRYPOINT ["/entrypoint.sh"]
