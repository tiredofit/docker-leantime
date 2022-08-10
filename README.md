# github.com/tiredofit/docker-leantime

[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/leantime.svg)](https://hub.docker.com/r/tiredofit/leantime)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/leantime.svg)](https://hub.docker.com/r/tiredofit/leantime)
[![Docker Layers](https://images.microbadger.com/badges/image/tiredofit/leantime.svg)](https://microbadger.com/images/tiredofit/leantime)

## About

This will build a Docker image for [Leantime](https://leantime.io/) - An open source project management tool.

* Automatically installs and sets up installation upon first start

[Changelog](CHANGELOG.md)

## Maintainer

- [Dave Conroy](https://github.com/tiredofit)

## Table of Contents


- [About](#about)
- [Maintainer](#maintainer)
- [Table of Contents](#table-of-contents)
- [Prerequisites and Assumptions](#prerequisites-and-assumptions)
- [Installation](#installation)
  - [Build from Source](#build-from-source)
  - [Prebuilt Images](#prebuilt-images)
    - [Multi Architecture](#multi-architecture)
- [Configuration](#configuration)
  - [Quick Start](#quick-start)
  - [Persistent Storage](#persistent-storage)
  - [Environment Variables](#environment-variables)
    - [Base Images used](#base-images-used)
    - [Application Settings](#application-settings)
    - [Database Settings](#database-settings)
    - [LDAP Settings](#ldap-settings)
    - [Storage Settings](#storage-settings)
      - [S3 Settings](#s3-settings)
    - [SMTP Settings](#smtp-settings)
  - [Networking](#networking)
- [Maintenance](#maintenance)
  - [Shell Access](#shell-access)
- [Support](#support)
  - [Usage](#usage)
  - [Bugfixes](#bugfixes)
  - [Feature Requests](#feature-requests)
  - [Updates](#updates)
- [License](#license)
- [References](#references)

## Prerequisites and Assumptions
*  Assumes you are using some sort of SSL terminating reverse proxy such as:
   *  [Traefik](https://github.com/tiredofit/docker-traefik)
   *  [Nginx](https://github.com/jc21/nginx-proxy-manager)
   *  [Caddy](https://github.com/caddyserver/caddy)

## Installation

### Build from Source
Clone this repository and build the image with `docker build <arguments> (imagename) .`

### Prebuilt Images
Builds of the image are available on [Docker Hub](https://hub.docker.com/r/tiredofit/leantime) and is the recommended method of installation.

```bash
docker pull tiredofit/leantime:(imagetag)
```

The following image tags are available along with their tagged release based on what's written in the [Changelog](CHANGELOG.md):

| Leantime version | Tag       |
| ---------------- | --------- |
| `latest`         | `:latest` |

#### Multi Architecture
Images are built primarily for `amd64` architecture, and may also include builds for `arm/v7`, `arm64` and others. These variants are all unsupported. Consider [sponsoring](https://github.com/sponsors/tiredofit) my work so that I can work with various hardware. To see if this image supports multiple architecures, type `docker manifest (image):(tag)`


## Configuration
### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.

**The first boot can take from 2 minutes - 5 minutes depending on your CPU to setup the proper schemas.**

Login to the web server and enter in your admin email address, admin password and start configuring the system!

### Persistent Storage

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

#### Base Images used

This image relies on an [Alpine Linux](https://hub.docker.com/r/tiredofit/alpine) base image that relies on an [init system](https://github.com/just-containers/s6-overlay) for added capabilities. Outgoing SMTP capabilities are handlded via `msmtp`. Individual container performance monitoring is performed by [zabbix-agent](https://zabbix.org). Additional tools include: `bash`,`curl`,`less`,`logrotate`,`nano`,`vim`.

Be sure to view the following repositories to understand all the customizable options:

| Image                                                         | Description                            |
| ------------------------------------------------------------- | -------------------------------------- |
| [OS Base](https://github.com/tiredofit/docker-alpine/)        | Customized Image based on Alpine Linux |
| [Nginx](https://github.com/tiredofit/docker-nginx/)           | Nginx webserver                        |
| [PHP-FPM](https://github.com/tiredofit/docker-nginx-php-fpm/) | PHP Interpreter                        |


#### Application Settings

| Parameter               | Description                                                                                    | Default             |
| ----------------------- | ---------------------------------------------------------------------------------------------- | ------------------- |
| `ADMIN_EMAIL`           | Administrator Email Address - Needed for logging in                                            | `admin@example.com` |
| `ADMIN_FIRST_NAME`      | Admin user First Name                                                                          | `Admin`             |
| `ADMIN_LAST_NAME`       | Admin user First Name                                                                          | `User`              |
| `ADMIN_PASS`            | Adminsitrator Password                                                                         | `admin`             |
| `APP_DEBUG`             | Application Debug Mode                                                                         | `FALSE`             |
| `COMPANY_NAME`          | Company Name                                                                                   | `Example Company`   |
| `DEFAULT_COLOR`         | Default Color for header                                                                       | `1b75bb`            |
| `ENABLE_AUTO_UPDATE`    | If coming from an earlier version of image, automatically update it to latest leantime release | `TRUE`              |
| `LANGUAGE`              | Application Language                                                                           | `en-US`             |
| `SESSION_EXPIRE`        | Session expiry in seconds                                                                      | `28800`             |
| `SETUP_TYPE`            | Automatically generate configuration via environment variables `AUTO` `MANUAL`                 | `AUTO`              |
| `SITE_NAME`             | Name of your Site                                                                              | `Leantime`          |
| `SITE_URL`              | The url your site listens on example `https://leantime.example.com`                            |                     |
| `THEME_COLOR_PRIMARY`   | Primary Theme Colour                                                                           | `#1b75bb`           |
| `THEME_COLOR_SECONDARY` | Secondary Theme Colour                                                                         | `#81b1a8`           |

Make sure you also set your `TIMEZONE` variable as referenced in the base image.

#### Database Settings
| Parameter | Description                                                 | default |
| --------- | ----------------------------------------------------------- | ------- |
| `DB_HOST` | Host or container name of MariaDB Server e.g. `leantime-db` |         |
| `DB_PORT` | MariaDB Port - Default `3306`                               | `3306`  |
| `DB_NAME` | MariaDB Database name e.g. `leantime`                       |         |
| `DB_USER` | MariaDB Username for above Database e.g. `leantime`         |         |
| `DB_PASS` | MariaDB Password for above Database e.g. `password`         |         |

#### LDAP Settings

Can also be set within the application

| Parameter                        | Description                                                                                                 | default                   |
| -------------------------------- | ----------------------------------------------------------------------------------------------------------- | ------------------------- |
| `ENABLE_LDAP`                    | Enable LDAP Functionality                                                                                   | `FALSE`                   |
| `LDAP_ATTRIBUTE_FIRST_NAME`      | LDAP Attribute First Name                                                                                   | `givenName`               |
| `LDAP_ATTRIBUTE_GROUPS`          | LDAP Attribute Groups                                                                                       | `memberOf`                |
| `LDAP_ATTRIBUTE_LAST_NAME`       | LDAP Attribute Last Name                                                                                    | `sn`                      |
| `LDAP_ATTRIBUTE_MAIL`            | LDAP Attribute Mail                                                                                         | `mail`                    |
| `LDAP_ATTRIBUTE_USER`            | LDAP Attribute User                                                                                         | `uid`                     |
| `LDAP_BASE_DN`                   | BaseDN eg `dc=example,dc=com`                                                                               |                           |
| `LDAP_BIND_DN`                   | Bind User                                                                                                   |                           |
| `LDAP_BIND_PASS`                 | Bind Pass                                                                                                   |                           |
| `LDAP_DEFAULT_ROLE`              |                                                                                                             |                           |
| `LDAP_DEFAULT_USER_KEY`          | Default role to add new users `10` client `20` developer `30` Client Manager `40` Manager`50` Administrator | `20`                      |
| `LDAP_DN`                        | Users Location eg `cn=users,dc=example,dc=com`                                                              |                           |
| `LDAP_GROUP_ROLE_ADMIN`          | LDAP Group name to assign Admin (40) Role                                                                   | `bookstack-admin`         |
| `LDAP_GROUP_ROLE_CLIENT_MANAGER` | LDAP Group name to assign Client Manager (30) Role                                                          | `bookstack-clientmanager` |
| `LDAP_GROUP_ROLE_CLIENT`         | LDAP Group name to assign Client (10) Role                                                                  | `bookstack-client`        |
| `LDAP_GROUP_ROLE_DEVELOPER`      | LDAP Group name to assign Developer (20) Role                                                               | `bookstack-developer`     |
| `LDAP_GROUP_ROLE_MANAGER`        | LDAP Group name to assign Manager (40) Role                                                                 | `bookstack-manager`       |
| `LDAP_HOST`                      | LDAP Hostname                                                                                               |                           |
| `LDAP_PORT`                      | LDAP Port                                                                                                   | `389`                     |
| `LDAP_TYPE`                      | `OL` OpenLDAP or `AD` Active Directory                                                                      | `OL`                      |
| `LDAP_USER_DOMAIN`               | Users domain eg '@example.com`                                                                              |                           |

| Parameter           | Description                                                          | default         |
| ------------------- | -------------------------------------------------------------------- | --------------- |
| `STORAGE_TYPE`      | Use `FILESYSTEM` or `S3` for storing uploaded files                  | `FILESYSTEM`    |
| `STORAGE_FILE_PATH` | Folder to store files (do not set if you are volume mapping `/data`) | `userfiles`     |
| `BACKUP_FILE_PATH`  | Application backup storage location                                  | `/data/backup/` |

#### Storage Settings

| Parameter           | Description                                                          | default         |
| ------------------- | -------------------------------------------------------------------- | --------------- |
| `STORAGE_TYPE`      | Use `FILESYSTEM` or `S3` for storing uploaded files                  | `FILESYSTEM`    |
| `STORAGE_FILE_PATH` | Folder to store files (do not set if you are volume mapping `/data`) | `userfiles`     |
| `BACKUP_FILE_PATH`  | Application backup storage location                                  | `/data/backup/` |


##### S3 Settings

Used only if `STORAGE_TYPE` = `S3`

| Parameter        | Description                   | default |
| ---------------- | ----------------------------- | ------- |
| `S3_BUCKET`      | S3 Bucket Name                |         |
| `S3_FOLDER_NAME` | S3 Folder Name (Can be blank) |         |
| `S3_ENDPOINT`    | S3 Endpoint                   |         |
| `S3_KEY`         | S3 Key                        |         |
| `S3_REGION`      | S3 Region                     |         |
| `S3_SECRET`      | S3 Secret                     |         |

#### SMTP Settings

Used only if `SMTP_ENABLE` = `TRUE`

| Parameter       | Description                                                         | default |
| --------------- | ------------------------------------------------------------------- | ------- |
| `SMTP_ENABLE`   | Use configured SMTP servers or rely on internal PHP mail() function | `FALSE` |
| `SMTP_AUTH`     | Use SMTP Authentication `TRUE` or `FALSE`                           | `FALSE` |
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
docker exec -it (whatever your container name is) bash
```
## Support

These images were built to serve a specific need in a production environment and gradually have had more functionality added based on requests from the community.
### Usage
- The [Discussions board](../../discussions) is a great place for working with the community on tips and tricks of using this image.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) personalized support.
### Bugfixes
- Please, submit a [Bug Report](issues/new) if something isn't working as expected. I'll do my best to issue a fix in short order.

### Feature Requests
- Feel free to submit a feature request, however there is no guarantee that it will be added, or at what timeline.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) regarding development of features.

### Updates
- Best effort to track upstream changes, More priority if I am actively using the image in a production environment.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) for up to date releases.

## License
MIT. See [LICENSE](LICENSE) for more details.

## References

* <https://leantime.io/>
* <https://github.com/Leantime/leantime>
