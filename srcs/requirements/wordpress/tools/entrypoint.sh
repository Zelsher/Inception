#!/bin/sh

# Attendre que la base de données soit prête
until mariadb -h$MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" &> /dev/null
do
    echo "⏳ En attente de MariaDB..."
    sleep 3
done
echo "✅ MariaDB est prêt."

# Télécharger WordPress si absent
if [ ! -f "/var/www/html/wp-config.php" ]; then
    echo "📥 Téléchargement de WordPress..."
    wp core download --allow-root

    echo "🛠 Configuration de WordPress..."
    wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --allow-root

    echo "🚀 Installation de WordPress..."
    wp core install --url="https://$DOMAIN_NAME" --title="My WordPress Site" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --allow-root

    echo "📌 Création d'un utilisateur normal..."
    wp user create $WP_USER $WP_USER_EMAIL --role=editor --user_pass=$WP_USER_PASSWORD --allow-root
fi

# Lancer PHP-FPM
echo "✅ WordPress est prêt."
exec php-fpm -F
