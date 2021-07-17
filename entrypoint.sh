#!/bin/sh
# Nico Schottelius, 2021-07-17

echo "Version 0.1"

allset=yes

# Check that all required variables are set
for var in SYNAPSE_CONFIG_DIR POSTGRES_USER POSTGRES_PASSWORD POSTGRES_DB POSTGRES_HOST; do
    eval content=\$$var

    if [ -z "$content" ]; then
        allset=""
        break
    fi
done

if [ "$allset" ]; then
    cat > "$SYNAPSE_CONFIG_DIR/postgres-db.yaml" <<EOF
database:
  name: "psycopg2"
    args:
      database: "$POSTGRES_DB"
      host: "$POSTGRES_HOST"
      user: "$POSTGRES_USER"
      password: "$POSTGRES_PASSWORD"
EOF

else
    echo "Not all variables set, not generating config" >&2
fi

echo /start.py "$@"
/start.py "$@"

python -m synapse.app.homeserver
