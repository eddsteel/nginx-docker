all: container

install: install-systemd install-cron

renew-cert:
	./renew.sh

container:
	docker build -t website .

run:
	docker run -i --rm --name site -p 80:80 -p 443:443 \
	-v /srv/www:/etc/nginx/html \
	-v /etc/nginx/sites-enabled:/etc/nginx/sites-enabled \
	-v /etc/nginx/sites-available:/etc/nginx/sites-available \
	-v /etc/letsencrypt/live/eddsteel.com:/etc/nginx/ssl \
	-v /etc/letsencrypt/archive:/etc/archive website

install-cron:
	ln -sf `pwd`/renew.sh /etc/cron.weekly/renew-ssl

install-systemd:
	cp nginx-docker.service /lib/systemd/system/nginx-docker.service
	systemctl enable nginx-docker
	systemctl start nginx-docker

restart:
	systemctl restart nginx-docker
