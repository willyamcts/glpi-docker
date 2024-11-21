#!/bin/bash

##
# Backup volume GLPI for exampleusing image from ServiceDesk Brasil
#  docker compose
#


DIR_BACKUP=/root/backups

volumes=$(docker volume ls |grep glpi |awk '{print $2}')


[[ $(realpath $DIR_BACKUP) != $DIR_BACKUP ]] && \
  echo "DIR_BACKUP DEVE ser fullpath" && \
  exit 1

#[[ $? = 2 ]] && \
for volume in ${volumes[@]}; do
  echo "* Backping from $volume -> /root/backups/$volume.tar.gz"

  docker run --rm \
    --mount source=$volume,target=/${volume} \
    -v $DIR_BACKUP:/backup \
    busybox \
    tar -czvf /backup/$volume.tar.gz /${volume}

done
