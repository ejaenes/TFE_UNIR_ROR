#!/bin/bash

set -euo pipefail

# Elimina un server.pid que potencialmente existe previamente para Rails.
rm -f /paper_scammer_docker/tmp/pids/server.pid

source helper.sh

show_banner

# Ejecuta el proceso principal del contenedor (lo que se establece como CMD en el Dockerfile).
exec "$@"
