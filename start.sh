#!/bin/bash

CUR_USER=$(whoami)

docker-compose build
docker-compose up -d kerberos

while [ ! -f kerberos-keytabs/client1.kerberos.keytab ]; 
do sleep 5;
done

sleep 5;

docker-compose down

sleep 5;

sudo chown -R ${CUR_USER}:${CUR_USER} *

#docker stack deploy -c docker-compose.yml kafka-kerberos