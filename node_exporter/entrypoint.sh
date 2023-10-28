echo "auth username: $BASIC_AUTH_USERNAME"

AUTH_RAW=$(htpasswd -nbB "$BASIC_AUTH_USERNAME" "$BASIC_AUTH_PASSWORD")

NODE_EXPORTER_AUTH=$(echo "$AUTH_RAW" | sed 's/:/: /')
echo "New Auth $NODE_EXPORTER_AUTH"

echo """
basic_auth_users:
  $NODE_EXPORTER_AUTH
""" > /etc/node_exporter/web.yml


echo "Other options: $@"

node_exporter --web.config.file=/etc/node_exporter/web.yml "$@"
