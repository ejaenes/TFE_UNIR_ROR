FROM --platform=linux/amd64 ruby:2.7.8-slim 

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    gnupg \
    cmake \
    python \
    supervisor \
    tar \
    tzdata \
    apt-transport-https \
    apt-utils

# Instala Node.js utilizando los paquetes de NodeSource
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y --no-install-recommends \
    nodejs

# Instala Yarn utilizando el repositorio oficial
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y --no-install-recommends \
    yarn

RUN mkdir -p /home/rails/app/current
WORKDIR /home/rails/app/current

COPY current .
COPY scripts/* /usr/local/bin/
RUN chmod -R +x /usr/local/bin

ENV PATH=/home/rails/app/current/bin:$PATH \
    RAILS_ENV="production" \
    CONFIG_FILE="config/puma.rb"

RUN prepare.sh

# Desinstalar dependencias de desarrollo y limpiar paquetes innecesarios
RUN apt-get purge -y --auto-remove build-essential cmake git curl && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3000

ENTRYPOINT ["entrypoint.sh"]
CMD ["run.sh"]
