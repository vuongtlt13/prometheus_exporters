# Prometheus exporters

### ALL EXPORTERS CAN SET BASIC AUTH BY CONFIGURING ENVIRONMENT VARIABLES


#### List of exporters
- [Node Exporter](https://hub.docker.com/r/vuongtlt13/node-exporter)
- [cAdvisor](https://hub.docker.com/r/vuongtlt13/cadvisor)


### 1. Node Exporter

Example for `docker-compose.yml`
```
version: '3'
services:
  node_exporter:
    image: vuongtlt13/node_exporter
    container_name: node_exporter
    build:
      context: ./node_exporter
    command:
      - "--path.rootfs=/host"
    ports:
      - 9100:9100
    pid: host
    restart: unless-stopped
    volumes:
      - '/:/host:ro,rslave'
    environment:
      - BASIC_AUTH_USERNAME=admin
      - BASIC_AUTH_PASSWORD=admin
```

FOR MORE OPTIONS SEE: https://github.com/prometheus/node_exporter


### 2. cAdvisor

Example for `docker-compose.yml`
```
version: '3'
services:
  cadvisor:
    image: vuongtlt13/cadvisor
    container_name: cadvisor
    build:
      context: ./cadvisor
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
    privileged: true
```

FOR MORE OPTIONS SEE: https://github.com/google/cadvisor