########################################## Paths ############################################

DOCKER_COMPOSE_PATH	=	./srcs/docker-compose.yml

DATA_PATH			= /home/dasanter/data

DB_PATH				= $(DATA_PATH)/db/

WP_PATH				= $(DATA_PATH)/wp/

########################################## Rules ############################################

# Create the data volumes folder and start the containers
all:
	mkdir -p $(DB_PATH) $(WP_PATH)
	grep -qxF '127.0.0.1 tamigore.42.fr' /etc/hosts || echo '127.0.0.1 tamigore.42.fr' >> /etc/hosts
	sudo docker-compose -f $(DOCKER_COMPOSE_PATH) up --build

# Stop the containers and remove images and networks
clean: stop
	sudo docker system prune -a --force

# Remove the data volumes folder
fclean: clean
	sudo rm -rf $(DATA_PATH)

# Stop the containers, remove images and networks and recreate the data volumes folder
re: fclean all


# Stop the containers
stop:
	sudo docker-compose -f $(DOCKER_COMPOSE_PATH) down


# Clean all previus containers, images and networks
reset:
	sudo bash ./srcs/requirements/tools/clean.sh

.PHONY: all stop clean fclean re ava
