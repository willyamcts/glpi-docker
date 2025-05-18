# GLPI Implementation

## Environment
The test running in Debian, using Docker [image from ServiceDesk Brasil](https://hub.docker.com/r/sdbrasil/glpi) where is compose from GLIP + PHP + MySQL database


## Considerations
 * All data is saved in mapped directories (see prepare.sh)
 * Other project to view: https://hub.docker.com/r/diouxx/glpi


## Usage

1. Clone this repository and entry in directory
2. Set execution permission to `prepare.sh` with `chmod +x prepare.sh`
3. Run `./prepare.sh`
4. Paste your certificate and key file in `$GLPI_PATH/etc/httpd/ssl` directory
5. Run `docker compose up -d`



# GLPI Inventory Automated

## GLPI Agent
To Agent Windows, follow the guide [glpi-agent installation](https://glpi-agent.readthedocs.io/en/latest/installation/) using even `winget` command, too check releases in [GitHub repository](https://github.com/glpi-project/glpi-agent/releases). In additional, the third party project can add a systry icon, check informations in [glpi-agentmonitor](https://github.com/glpi-project/glpi-agentmonitor).
