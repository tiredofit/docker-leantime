FROM docker.io/tiredofit/nginx-php-fpm:8.0
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

### Set Defaults
ENV LEANTIME_VERSION=v2.2.4 \
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
    IMAGE_NAME="tiredofit/leantime" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-leantime/"

### Perform Installation
RUN set -x && \
    apk update && \
    apk upgrade && \
    apk add -t .leantime-build-deps \
              git \
              nodejs \
              npm \
	      && \
    \
    apk add -t .leantime-run-deps \
              expect \
              gnu-libiconv \
              sed \
	      && \
    \
### WWW  Installation
    php-ext enable core && \    
    mkdir -p /assets/install && \
    git clone ${LEANTIME_REPO_URL} /assets/install && \
    cd /assets/install && \
    git checkout ${LEANTIME_VERSION} && \
    composer install && \
    npm install && \
    ./node_modules/grunt/bin/grunt Build-All && \
    rm -rf /assets/install/nginx.conf && \
    chown -R nginx:www-data /assets/install && \
    \
### Cleanup
    apk del .leantime-build-deps && \
    rm -rf /root/.composer /root/.config /root/.npm && \
    rm -rf /var/tmp/* /var/cache/apk/*

ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php7

### Assets
ADD install /
