# Utilise une base Alpine (avant-dernière version stable)
FROM alpine:3.18

# Installe NGINX et OpenSSL pour le HTTPS
RUN apk add --no-cache nginx openssl

# Crée un dossier pour le certificat et la clé
RUN mkdir -p /etc/nginx/ssl

# Copie la configuration NGINX et les certificats SSL
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/self-signed.crt /etc/nginx/ssl/
COPY tools/self-signed.key /etc/nginx/ssl/

# Crée le dossier des logs et ajuste les permissions
RUN mkdir -p /var/log/nginx /run/nginx && \
    chown -R nginx:nginx /var/lib/nginx /var/log/nginx /run/nginx

# Expose le port HTTPS
EXPOSE 443

# Commande de démarrage
CMD ["nginx", "-g", "daemon off;"]
