# GLPI Implementation

## Environment
The test running in Debian, using Docker [image from ServiceDesk Brasil](https://hub.docker.com/r/sdbrasil/glpi) where is compose from GLIP + PHP + Percona database (MySQL)


## Considerations
 * All data is saved in mapped directories (see prepare.sh)
 * Running on HTTPS, i.e. SSL certificate is required
 * Other project to view: https://hub.docker.com/r/diouxx/glpi


## Usage
1. Clone this repository and entry in directory
2. Set execution permission to `prepare.sh` with `chmod +x prepare.sh`
3. Run `./prepare.sh`
4. Paste your certificate and key file in `/usr/local/glpi/etc/httpd/ssl` directory.
   * The name cert should `cert.crt` and key file `key.key`
6. Insert FQDN in your directive ServerName from `/usr/local/glpi/etc/httpd/glpi.conf`
7. Run `docker compose up -d`
8. Access web `https://<IP> `
9. In "step 1" from settings, insert information about database. After, select database `glpi`
    * address: `db-glpi-10` (field `container_name` from docker-compose)
    * user: `glpi` (field `MYSQL_USER` from docker-compose)
    * password: <field `MYSQL_PASSWORD` from docker-compose>
10. After finishing the installation, run the command `docker exec -it glpi-10 rm /usr/share/glpi/install/install.php`
11. Finished, good work.




# GLPI Inventory Automated

## GLPI Agent
To Agent Windows, follow the guide [glpi-agent installation](https://glpi-agent.readthedocs.io/en/latest/installation/) using even `winget` command, too check releases in [GitHub repository](https://github.com/glpi-project/glpi-agent/releases). In additional, the third party project can add a systry icon, check informations in [glpi-agentmonitor](https://github.com/glpi-project/glpi-agentmonitor).
