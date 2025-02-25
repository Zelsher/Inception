# Variables
COMPOSE = docker-compose
DOCKER = docker

# Chemin du fichier docker-compose
COMPOSE_FILE = ./srcs/docker-compose.yml

# Liste des services
SERVICES = mariadb wordpress

# Règle principale : lance toute l'infrastructure
all: build up

# Construit les images Docker des services
build:
	$(COMPOSE) -f $(COMPOSE_FILE) build

# Démarre les conteneurs
up:
	$(COMPOSE) -f $(COMPOSE_FILE) up -d

# Arrête les conteneurs sans les supprimer
stop:
	$(COMPOSE) -f $(COMPOSE_FILE) stop

# Supprime les conteneurs et les volumes (sans supprimer les images)
clean:
	$(COMPOSE) -f $(COMPOSE_FILE) down -v

# Supprime tout et reconstruit
re: clean all

# Affiche les logs en temps réel
logs:
	$(COMPOSE) -f $(COMPOSE_FILE) logs -f

# Vérifie l'état des conteneurs
ps:
	$(COMPOSE) -f $(COMPOSE_FILE) ps
