#!/usr/bin/env bash


# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

echo "Creating replication user..."
psql -d "${POSTGRES_DB}" -c "
    DROP ROLE IF EXISTS ${KOBO_POSTGRES_REPLICATION_USER};
    CREATE USER ${KOBO_POSTGRES_REPLICATION_USER} REPLICATION LOGIN CONNECTION LIMIT 2 ENCRYPTED PASSWORD '${KOBO_POSTGRES_REPLICATION_PASSWORD}';
"
echo "Replication user created!"
