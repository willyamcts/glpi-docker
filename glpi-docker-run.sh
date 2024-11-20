#!/bin/bash

GLPI_PATH=/etc/glpi
GLPI_LOG=/var/log/glpi

[ -d $GLPI_PATH ] && mkdir -p $GLPI_PATH

# MySQL: percona-lib, percona-log
volumes=( "documents"
"marketplace"
"plugins"
"_pictures"
"_plugins"
"etc"
"imagens-custom"
"backup"
"percona-lib"
"percona-log" )

for vol in ${volumes[@]}; do
  # name volume
  volume_name="gpli-${vol}"

  # path local to volume
  [ $(echo $vol |grep 'log') ] && \
    volume_dst="${GLPI_LOG}" || volume_dst="${GLPI_PATH}/${vol}"

  # create directory
  mkdir -p $volume_dst

  # create volume
  docker volume create \
    --driver local \
    --opt type=none \
    --opt device=$volume_dst \
    --opt o=bind \
    $volume_name
done

chown -R 70:70 $GLPI_PATH
chown -R 1001:0 ${GLPI_PATH}/percona-* $GLPI_LOG

docker volume ls

## Volumes in compose::
#    driver: local
#    driver_opts:
#      type: none
#      device: /var/glpi
#      o: bind


docker network create --driver bridge glpi

docker run -d --name db-glpi-10 --network glpi \
  -e MYSQL_ROOT_PASSWORD=ADM@MySQL_GLP1 \
  -e MYSQL_DATABASE=glpi \
  -e MYSQL_USER=glpi \
  -e MYSQL_PASSWORD=GLP1_MySQL@10 \
  -e TZ=America/Sao_Paulo \
  -v glpi-percona-lib:/var/lib/mysql \
  -v glpi-percona-log:/var/log/mysql \
  -v glpi-backup:/backup \
  percona/percona-server:8.0 \
  --character-set-server=utf8mb4 \
  --collation-server=utf8mb4_general_ci

docker run -d --name glpi-10 --network glpi -p 80:80 \
  -v glpi-documents:/var/lib/glpi/files/data-documents \
  -v glpi-marketplace:/var/lib/glpi/marketplace \
  -v glpi-imagens-custom:/usr/share/glpi/pics/imagens-custom \
  -v glpi-marketplace:/usr/share/glpi/marketplace \
  -v glpi-plugins:/usr/share/glpi/plugins \
  -v glpi_pictures:/var/lib/glpi/files/_pictures \
  -v glpi-_plugins:/var/lib/glpi/files/_plugins \
  -v glpi-etc:/etc/glpi/ \
  -v glpi-backup:/backup/ \
  sdbrasil/glpi:10.0.17