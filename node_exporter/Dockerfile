FROM alpine

# install htpasswd
RUN apk update && apk add apache2-utils prometheus-node-exporter --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community

WORKDIR /etc/node_exporter

COPY --chmod=765 ./entrypoint.sh ./entrypoint.sh

ENTRYPOINT [ "/bin/sh", "/etc/node_exporter/entrypoint.sh" ]


