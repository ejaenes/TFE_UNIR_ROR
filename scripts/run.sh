#!/bin/bash

source helper.sh

info "Starting app..."
exec bundle exec puma -C "$CONFIG_FILE"
