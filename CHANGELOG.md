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

