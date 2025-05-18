# make dirs in host
## GLPI
GLPI_PATH=/usr/local/glpi
mkdir -p ${GLPI_PATH}/etc
mkdir -p ${GLPI_PATH}/var
mkdir ${GLPI_PATH}/etc/{glpi,httpd}
mkdir ${GLPI_PATH}/etc/httpd/ssl
mkdir ${GLPI_PATH}/var/{documents,marketplace,plugins,_plugins}
mkdir ${GLPI_PATH}/log
mkdir ${GLPI_PATH}/backup
touch ${GLPI_PATH}/log/php-errors.log

## Database
DB_PATH=/usr/local/percona
mkdir -p ${DB_PATH}/var
mkdir -p ${DB_PATH}/log
mkdir -p ${DB_PATH}/backup


#
# apply permission
chown -R 48:48 $GLPI_PATH
chown -R 1000:1000 ${GLPI_PATH}/var/plugins

chown -R 1001:1001 ${DB_PATH}/var
