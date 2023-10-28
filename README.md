# Prometheus exporters

### ALL EXPORTERS CAN SET BASIC AUTH BY CONFIGURING ENVIRONMENT VARIABLES


#### List of exporters
- Node Exporter
- [cAdvisor](https://hub.docker.com/r/vuongtlt13/cadvisor)


### 1. Node Exporter

### 2. cAdvisor

Example for `docker-compose.yml`
```
version: '3'
services:
  cadvisor:
    image: vuongtlt13/cadvisor
    ports:
      - 8080:8080
    command: 
     - "--housekeeping_interval=5s"
    volumes:
      - /:/rootfs:ro
      - /var/run:/var/run:rw
      - /sys:/sys:ro
      - /var/lib/docker/:/var/lib/docker:ro
      - /dev/disk:/dev/disk/:ro
    environment:
      - BASIC_AUTH_USERNAME=admin
      - BASIC_AUTH_PASSWORD=admin
```