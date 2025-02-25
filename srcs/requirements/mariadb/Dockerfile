# On prend l'avant-dernière version stable de MariaDB sur Alpine
FROM mariadb:10.6

# On définit le répertoire de travail
WORKDIR /var/lib/mysql

# On copie notre script d'initialisation
COPY tools/init_db.sh /docker-entrypoint-initdb.d/

# On rend le script exécutable
RUN chmod +x /docker-entrypoint-initdb.d/init_db.sh

# On expose le port par défaut de MariaDB
EXPOSE 3306

# On utilise l'entrée par défaut de MariaDB (déjà définie par l'image officielle)
