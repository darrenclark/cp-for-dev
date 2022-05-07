#!/usr/bin/env bash

set -euo pipefail

# Pulled from the provided /etc/schema-registry/schema-registry.properties
#
# cat $CONFLUENT_HOME/etc/schema-registry/schema-registry.properties | \
#   grep -v '^#' | \
#   grep -E '^.' | \
#   awk 'BEGIN { FS="=" } { gsub(/\./, "_", $1); print "export SCHEMA_REGISTRY_" toupper($1) "=\"${SCHEMA_REGISTRY_" toupper($1) ":-" $2 "}\"" }'

export SCHEMA_REGISTRY_LISTENERS="${SCHEMA_REGISTRY_LISTENERS:-http://0.0.0.0:8081}"
export SCHEMA_REGISTRY_KAFKASTORE_BOOTSTRAP_SERVERS="${SCHEMA_REGISTRY_KAFKASTORE_BOOTSTRAP_SERVERS:-PLAINTEXT://localhost:9092}"
export SCHEMA_REGISTRY_KAFKASTORE_TOPIC="${SCHEMA_REGISTRY_KAFKASTORE_TOPIC:-_schemas}"
export SCHEMA_REGISTRY_DEBUG="${SCHEMA_REGISTRY_DEBUG:-false}"

# Convert all KAFKA_* env vars into a .properties file
gomplate -f schema-registry.properties.tmpl -o schema-registry.properties

echo "Waiting for kafka broker to be up..."
while ! kafka-topics --bootstrap-server=$SCHEMA_REGISTRY_KAFKASTORE_BOOTSTRAP_SERVERS --list >/dev/null ; do
  echo "Waiting for kafka broker to be up..."
done

schema-registry-start schema-registry.properties
