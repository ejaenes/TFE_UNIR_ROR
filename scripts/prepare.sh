#!/bin/bash

set -euo pipefail

# Asigna los permisos correctos al directorio /home/rails
chmod -R g+rwX /home/rails

# Navega al directorio de la aplicación
cd /home/rails/app/current

# Configura la opción 'system' en true para que las gemas se instalen en el sistema
bundle config set system 'true'

# Verifica si hay gemas faltantes y las instala si es necesario
bundle check || bundle install --jobs 6 --retry 4

# Compila los assets de Webpack
bundle exec ./bin/webpack
