# hub.docker.com/r/tiredofit/leantime

[![Build Status](https://img.shields.io/docker/build/tiredofit/leantime.svg)](https://hub.docker.com/r/tiredofit/leantime)
[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/leantime.svg)](https://hub.docker.com/r/tiredofit/leantime)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/leantime.svg)](https://hub.docker.com/r/tiredofit/leantime)
[![Docker Layers](https://images.microbadger.com/badges/image/tiredofit/leantime.svg)](https://microbadger.com/images/tiredofit/leantime)

## Introduction

This will build a container for [Leantime](https://leantime.io/) - An open source project management tool.

* Automatically installs and sets up installation upon first start

* This Container uses a [customized Alpine base](https://hub.docker.com/r/tiredofit/alpine) which includes [s6 overlay](https://github.com/just-containers/s6-overlay) enabled for PID 1 Init capabilities, [zabbix-agent](https://zabbix.org) for individual container monitoring, Cron also installed along with other tools (bash,curl, less, logrotate, nano, vim) for easier management. It also supports sending to external SMTP servers..

[Changelog](CHANGELOG.md)

## Authors

- [Dave Conroy](https://github.com/tiredofit)

## Table of Contents


- [Introduction](#introduction)
- [Authors](#authors)
- [Table of Contents](#table-of-contents)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [Quick Start](#quick-start)
- [Configuration](#configuration)
  - [Data-Volumes](#data-volumes)
  - [Environment Variables](#environment-variables)
    - [Application Settings](#application-settings)
    - [Database Settings](#database-settings)
    - [Storage Settings](#storage-settings)
      - [S3 Settings](#s3-settings)
    - [SMTP Settings](#smtp-settings)
  - [Networking](#networking)
- [Maintenance](#maintenance)
  - [Shell Access](#shell-access)
- [References](#references)

## Prerequisites

This image assumes that you are using a reverse proxy such as
[jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy) and optionally the [Let's Encrypt Proxy
Companion @
https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion](https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion)
in order to serve your pages. However, it will run just fine on it's own if you map appropriate ports. See the examples folder for a docker-compose.yml that does not rely on a reverse proxy.

You will also need an external MariaDB container

## Installation

Automated builds of the image are available on [Docker Hub](https://hub.docker.com/r/tiredofit/leantime) and is the recommended method of installation.

```bash
docker pull tiredofit/leantime
```

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.
* Make [networking ports](#networking) available for public access if necessary

**The first boot can take from 2 minutes - 5 minutes depending on your CPU to setup the proper schemas.**

Login to the web server and enter in your admin email address, admin password and start configuring the system!

## Configuration

### Data-Volumes

The following directories are used for configuration and can be mapped for persistent storage.

| Directory                | Description                                                                                                              |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------ |
| `/www/logs`              | Nginx and PHP Log files                                                                                                  |
| `/assets/custom`         | (Optional) Copy source code over existing source code in /www/html upon container start. Use exact file/folder structure |
| `/assets/custom-scripts` | (Optional) If you want to execute custom scripting, place scripts here with extension `.sh`                              |
| `/assets/modules`        | (Optional) If you want to add additional modules outside of the source tree, add them here                               |
| `/www/html`              | (Optional) If you want to expose the leantime sourcecode and enable Self Updating, expose this volume                    |
| *OR                      |                                                                                                                          |
| `/data`                  | Hold onto your persistent sessions and cache between container restarts                                                  |

### Environment Variables

Along with the Environment Variables from the [Base image](https://hub.docker.com/r/tiredofit/alpine), and [Web Image](https://hub.docker.com/r/tiredofit/nginx), and [PHP Image](https://hub.docker.com/r/tiredofit/nginx-php-fpm) below is the complete list of available options that can be used to customize your installation.

#!/usr/bin/with-contenv bash

#### Application Settings

| Parameter            | Description                                                                                    | Default             |
| -------------------- | ---------------------------------------------------------------------------------------------- | ------------------- |
| `ADMIN_EMAIL`        | Administrator Email Address - Needed for logging in                                            | `admin@example.com` |
| `ADMIN_FIRST_NAME`   | Admin user First Name                                                                          | `Admin`             |
| `ADMIN_LAST_NAME`    | Admin user First Name                                                                          | `User`              |
| `ADMIN_PASS`         | Adminsitrator Password                                                                         | `admin`             |
| `COMPANY_NAME`       | Company Name                                                                                   | `Example Company`   |
| `DEFAULT_COLOR`      | Default Color for header                                                                       | `1b75bb`            |
| `ENABLE_AUTO_UPDATE` | If coming from an earlier version of image, automatically update it to latest leantime release | `TRUE`              |
| `LANGUAGE`           | Application Language                                                                           | `en-US`             |
| `SESSION_EXPIRE`     | Session expiry in seconds                                                                      | `28800`             |
| `SETUP_TYPE`         | Automatically generate configuration via environment variables `AUTO` `MANUAL`                 | `AUTO`              |
| `SITE_NAME`          | Name of your Site                                                                              | `Leantime`          |
| `SITE_URL`           | The url your site listens on example `https://leantime.example.com`                            |                     |

#### Database Settings
| Parameter | Description                                                 | default |
| --------- | ----------------------------------------------------------- | ------- |
| `DB_HOST` | Host or container name of MariaDB Server e.g. `leantime-db` |         |
| `DB_PORT` | MariaDB Port - Default `3306`                               | `3306`  |
| `DB_NAME` | MariaDB Database name e.g. `leantime`                       |         |
| `DB_USER` | MariaDB Username for above Database e.g. `leantime`         |         |
| `DB_PASS` | MariaDB Password for above Database e.g. `password`         |         |

#### Storage Settings

| Parameter           | Description                                                          | default      |
| ------------------- | -------------------------------------------------------------------- | ------------ |
| `STORAGE_TYPE`      | Use `FILESYSTEM` or `S3` for storing uploaded files                  | `FILESYSTEM` |
| `STORAGE_FILE_PATH` | Folder to store files (do not set if you are volume mapping `/data`) | `userfiles`  |

##### S3 Settings

Used only if `STORAGE_TYPE` = `S3`

| Parameter        | Description                   | default |
| ---------------- | ----------------------------- | ------- |
| `S3_BUCKET`      | S3 Bucket Name                |         |
| `S3_FOLDER_NAME` | S3 Folder Name (Can be blank) |         |
| `S3_KEY`         | S3 Key                        |         |
| `S3_REGION`      | S3 Region                     |         |
| `S3_SECRET`      | S3 Secret                     |         |

#### SMTP Settings
Used only if `SMTP_ENABLE` = `TRUE`

| Parameter       | Description                                                         | default |
| --------------- | ------------------------------------------------------------------- | ------- |
| `SMTP_ENABLE`   | Use configured SMTP servers or rely on internal PHP mail() function | `FALSE` |
| `SMTP_FROM`     | SMTP From Name / Return Email Address                               |         |
| `SMTP_HOST`     | SMTP Host                                                           |         |
| `SMTP_PASS`     | SMTP Password                                                       |         |
| `SMTP_PORT`     | SMTP Port                                                           |         |
| `SMTP_PROTOCOL` | SMTP Security Protocol `TLS`, `SSL`, `STARTTLS`                     |         |
| `SMTP_TLS_AUTO` | Automatically detect if we can use TLS                              | `TRUE`  |
| `SMTP_USER`     | SMTP User                                                           |         |

### Networking

The following ports are exposed.

| Port | Description |
| ---- | ----------- |
| `80` | HTTP        |

## Maintenance

### Shell Access

For debugging and maintenance purposes you may want access the containers shell.

```bash
docker exec -it (whatever your container name is e.g. leantime) bash
```

## References

* <https://leantime.io/>
* <https://github.com/Leantime/leantime>
