FROM debian:buster

########################### INSTALL MARIADB ##########################

RUN apt-get update && apt-get upgrade -y

RUN	apt-get install -y mariadb-server

RUN apt-get -y install sudo

########################### CONFIG MARIADB ###########################

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/start.sh /tmp

##################### USING START AS ENTRYPOINT  #####################

ENTRYPOINT ["/bin/sh", "/tmp/start.sh"]
