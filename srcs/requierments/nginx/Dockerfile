######################################################################
############################ BASE IMAGE  #############################
######################################################################

FROM debian:buster

######################################################################
########################### INSTALL NGINX  ###########################
######################################################################

RUN apt-get update && apt-get upgrade -y

RUN	apt-get install -y nginx

RUN rm -rf /var/lib/apt/lists/*

######################################################################
########################### CONFIGURATION ############################
######################################################################

# Certificate
COPY conf/certificate /etc/ssl/certificate

COPY conf/tamigore.conf /etc/nginx/sites-available/tamigore

# Create symbolic link from sites-available to sites-enabled 
RUN ln -s /etc/nginx/sites-available/tamigore /etc/nginx/sites-enabled/tamigore

# Remove index HTML file
RUN	rm /var/www/html/index.nginx-debian.html

ENTRYPOINT ["nginx", "-g", "daemon off;"]
