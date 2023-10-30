FROM gcr.io/cadvisor/cadvisor:v0.47.2

# install htpasswd
RUN apk add apache2-utils

WORKDIR /etc/cadvisor

COPY --chmod=765 ./entrypoint.sh ./entrypoint.sh

ENTRYPOINT [ "/bin/sh", "/etc/cadvisor/entrypoint.sh" ]


