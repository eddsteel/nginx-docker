#!/bin/sh

/home/edd/.local/share/letsencrypt/bin/letsencrypt certonly --keep-until-expiring \
                                                   --webroot -w /srv/www -d eddsteel.com
tail /var/log/letsencrypt/letsencrypt.log

service nginx-docker restart
