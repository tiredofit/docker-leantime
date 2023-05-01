## 1.0.25 2023-05-01 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.3.21


## 1.0.24 2023-04-24 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.3.19


## 1.0.23 2023-04-16 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.3.16


## 1.0.22 2023-04-08 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.3.15


## 1.0.21 2023-03-12 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.3.14


## 1.0.20 2023-02-17 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.3.13


## 1.0.19 2023-02-12 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.3.11


## 1.0.18 2023-02-11 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.3.8


## 1.0.17 2023-02-11 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.3.7


## 1.0.16 2023-01-23 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.3.6


## 1.0.15 2023-01-16 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.3.5


## 1.0.14 2023-01-05 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.3.4
      - Added `SPECIFY_MENU_PER_PROJECT` environment variable
      - Added `PERSIST_THEME` environment variable
      - Added `SMTP_TLS_NO_VERIFY` environment variable
      - Updated build to current build process format


## 1.0.13 2022-11-11 <dave at tiredofit dot ca>

   ### Added
      - Leantimew 2.2.11


## 1.0.12 2022-10-21 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.2.10


## 1.0.11 2022-10-13 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.2.8


## 1.0.10 2022-10-07 <dave at tiredofit dot ca>

   ### Changed
      - Fix storage issues of logo (@ArjenR@github)
      - Fix Nginx configuration (ArjenR@github)
      - Fix for not using local file storage (@ArjenR@github)
      - Tweak S3 Configuration (ArjenR@github)
      - Change the way installation files get cloned


## 1.0.9 2022-10-05 <dave at tiredofit dot ca>

   ### Changed
      - Migrate legacy nginx configuration


## 1.0.8 2022-09-15 <dave at tiredofit dot ca>

   ### Changed
      - Fix for New Install Looping not being able to find a file


## 1.0.7 2022-08-25 <dave at tiredofit dot ca>

   ### Added
      - Introduce LDAP_ATTRIBUTE_PHONE
      - Introduce DB_PORT
      - Introduce proper APP_DEBUG environment variable


## 1.0.6 2022-08-25 <dave at tiredofit dot ca>

   ### Changed
      - We're using Leantime, not Bookstack. All LDAP Role names changed to "leantime-*"
      - Fixed mispelling for memberOf for LDAP Group assignment


## 1.0.5 2022-08-24 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.2.7


## 1.0.4 2022-08-23 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.2.6


## 1.0.3 2022-08-22 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.2.5


## 1.0.2 2022-08-20 <dave at tiredofit dot ca>

   ### Changed
      - Fix for LDAP_ATTRIBUTE_FIRST_NAME value


## 1.0.1 2022-08-10 <dave at tiredofit dot ca>

   ### Changed
      - Fixup to 1.0.0 release
      - Correctly added Primary Secondary Theme Colors
      - Added Default LDAP_PORT environment variable
      - Added S3_ENDPOINT_PATHSTYLE delcaration


## 1.0.0 2022-08-10 <dave at tiredofit dot ca>

   ### Added
      - Update configuration to support Primary Theme Colours
      - Update configuration to support Secondary Theme Colours
      - Add LDAP Support
      - Add App Debugging Support
      - Add additional S3 Features
      - Add Default Timezone configuration
      - Cleanup Code


## 0.99.26 2022-08-06 <dave at tiredofit dot ca>

   ### Added
      - Start using custom_scripts and custom_files functions from base


## 0.99.25 2022-08-01 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.2.4


## 0.99.24 2022-07-27 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.2.3


## 0.99.23 2022-07-25 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.2.2


## 0.99.22 2022-07-16 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.2.1


## 0.99.21 2022-07-13 <dave at tiredofit dot ca>

   ### Added
      - Update to PHP 8.0


## 0.99.20 2022-07-13 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.2.0


## 0.99.19 2022-07-05 <dave at tiredofit dot ca>

   ### Changed
      - Force LDAP Extension to load upon composer install


## 0.99.18 2022-06-23 <dave at tiredofit dot ca>

   ### Added
      - Support tiredofit/nginx:6.0.0 and tiredofit/nginx-php-fpm:7.0.0 changes


## 0.99.17 2022-04-26 <dave at tiredofit dot ca>

   ### Changed
      - Update logrotate directory


## 0.99.16 2022-04-22 <dave at tiredofit dot ca>

   ### Added
      - Leantime 2.1.9


## 0.99.15 2022-04-21 <dave at tiredofit dot ca>

   ### Added
      - Revert to PHP 7.4


## 0.99.14 2022-03-14 <dave at tiredofit dot ca>

   ### Changed
      - Fix for S6 Overlay 3.0 removing access to /var/run/s6/services/


## 0.99.13 2022-02-10 <dave at tiredofit dot ca>

   ### Changed
      - Update to support upstream base image features


## 0.99.12 2021-10-21 <dave at tiredofit dot ca>

   ### Added
      - PHP 8.0
      - Leantime 2.1.8


## 0.99.11 2020-10-26 <dave at tiredofit dot ca>

   ### Added
      - Force PHP XMLWriter to be enabled


## 0.99.10 2020-10-19 <dave at tiredofit dot ca>

   ### Changed
      - Fix storage user files path


## 0.99.9 2020-10-19 <dave at tiredofit dot ca>

   ### Added
      - Add SMTP_AUTH environment variable


## 0.99.8 2020-10-18 <dave at tiredofit dot ca>

   ### Added
      - Add logrotation for leantime error logs


## 0.99.7 2020-10-18 <dave at tiredofit dot ca>

   ### Changed
      - Change default session time to 86400 seconds


## 0.99.6 2020-10-17 <dave at tiredofit dot ca>

   ### Added
      - Add nginx declaration for /logout parameter


## 0.99.5 2020-10-14 <dave at tiredofit dot ca>

   ### Changed
      - Patchup with persistent files


## 0.99.4 2020-10-14 <dave at tiredofit dot ca>

   ### Changed
      - Map missing userfiles directory and fix path permissions


## 0.99.3 2020-10-14 <dave at tiredofit dot ca>

   ### Changed
      - Fix service from looping after checking for migrations


## 0.99.2 2020-10-07 <dave at tiredofit dot ca>

   ### Added
      - Add additional mapping for public/userfiles to persist logo on container restarts


## 0.99.1 2020-09-21 <dave at tiredofit dot ca>

   ### Added
      - Cleanup image after build


## 0.99.0 2020-09-20 <dave at tiredofit dot ca>

   ### Added
      - Initial Releaase
      - PHP 7.3
      - Leantime 2.1.4
      - Auto installation routines built in

