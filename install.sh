#!/bin/bash

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -gt 1 ] || die "2 arguments required, $# provided"

USERNAME=$1

if [[ -z "$USERNAME" ]]; then
    die "USERNAME at argument #1 must be set"
fi

PASSWORD=$2
if [[ -z "$PASSWORD" ]]; then
    die "PASSWORD at argument #2 must be set"
fi

COMPONENTS=$3
if [[ -z "$COMPONENTS" ]]; then
    COMPONENTS="node_exporter,cadvisor"
fi

# 1. generate password 
echo "$USERNAME $PASSWORD"
apt-get install -y apache2-utils
AUTH_RAW=$(htpasswd -nbB "$USERNAME" "$PASSWORD")

mkdir -p config
htpasswd -nb "$USERNAME" "$PASSWORD" > ./config/auth.htpassw

NODE_EXPORTER_AUTH=$(echo "$AUTH_RAW" | sed 's/:/: /')
echo "New Auth $NODE_EXPORTER_AUTH"

echo """
basic_auth_users:
  $NODE_EXPORTER_AUTH
""" > ./config/web.yml

chmod 777 -R ./config

# generate docker-compose
CONTENT=$(cat ./templates/compose.yml)
echo "$CONTENT" > docker-compose.yml

IFS=',' read -ra components <<< "$COMPONENTS"
for component in "${components[@]}"
do
    component="${component#"${component%%[![:space:]]*}"}"
    component="${component%"${component##*[![:space:]]}"}"
    echo "Generating config for $component..."
    component_content=$(cat "./templates/$component.yml")
    echo -e "\tContent: $component_content"
    echo "$component_content" >> docker-compose.yml
    echo "Generating config for $component...DONE!"
done

# run docker-compose
docker compose up
