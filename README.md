# GLPI Implementation

## Environment
The test running in Debian, using Docker [image from ServiceDesk Brasil](https://hub.docker.com/r/sdbrasil/glpi) where is compose from GLIP + PHP + MySQL database


## Considerations
 * All data is saved in mapped directories ??
 * Other project to view: https://hub.docker.com/r/diouxx/glpi


## GLPI Agent
To Agent Windows, follow the guide [glpi-agent installation](https://glpi-agent.readthedocs.io/en/latest/installation/) using even `winget` command. In additional, the third party project can add a systry icon, check informations in [glpi-agentmonitor](https://github.com/glpi-project/glpi-agentmonitor).
