ARG PHP_BASE=8.0
ARG DISTRO="alpine"

FROM docker.io/tiredofit/nginx-php-fpm:${PHP_BASE}-${DISTRO}
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ARG LEANTIME_VERSION

ENV LEANTIME_VERSION=${LEANTIME_VERSION:-"v2.3.4"} \
    LEANTIME_REPO_URL=https://github.com/Leantime/leantime \
    NGINX_SITE_ENABLED=leantime \
    NGINX_WEBROOT=/www/html \
    PHP_ENABLE_CREATE_SAMPLE_PHP=FALSE \
    PHP_ENABLE_CURL=TRUE \
    PHP_ENABLE_FILEINFO=TRUE \
    PHP_ENABLE_ICONV=TRUE \
    PHP_ENABLE_IMAP=TRUE \
    PHP_ENABLE_LDAP=TRUE \
    PHP_ENABLE_OPENSSL=TRUE \
    PHP_ENABLE_SIMPLEXML=TRUE \
    PHP_ENABLE_TOKENIZER=TRUE \
    PHP_ENABLE_XMLWRITER=TRUE \
    PHP_ENABLE_ZIP=TRUE \
    LD_PRELOAD="/usr/lib/preloadable_libiconv.so php" \
    IMAGE_NAME="tiredofit/leantime" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-leantime/"

RUN source /assets/functions/00-container && \
    set -x && \
    package update && \
    package upgrade && \
    package install .leantime-build-deps \
              git \
              nodejs \
              npm \
              && \
    \
    package install .leantime-run-deps \
              expect \
              gnu-libiconv \
              sed \
              && \
    \
    php-ext enable core && \
    clone_git_repo "${LEANTIME_REPO_URL}" "${LEANTIME_VERSION}" /assets/install && \
    composer install && \
    npm install && \
    ./node_modules/grunt/bin/grunt Build-All && \
    rm -rf /assets/install/nginx.conf && \
    chown -R "${NGINX_USER}":"${NGINX_GROUP}" /assets/install && \
    \
    package remove .leantime-build-deps && \
    package cleanup && \
    rm -rf /root/.composer \
           /root/.config \
           /root/.npm

COPY install /
