ARG ARCH=
FROM ${ARCH}ubuntu:focal

RUN cd ~; \
	export DEBIAN_FRONTEND='noninteractive'; \
	apt-get update; \
	apt-get install -y --no-install-recommends apt-utils; \
	apt-get install -y --no-install-recommends mc less nano wget pv zip unzip supervisor net-tools sudo apache2 php7.4 php7.4-common php7.4-mysql php7.4-gd php7.4-xml php7.4-zip php7.4-opcache php7.4-curl php7.4-mbstring php-imagick; \
	sed -i "s|www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin|www-data:x:33:33:www-data:/var/www:/bin/bash|g" /etc/passwd; \
	a2enmod rewrite; \
	a2enmod proxy; \
	a2enmod proxy_http; \
	a2enmod proxy_balancer; \
	a2enmod proxy_wstunnel; \
	apt-get clean; \
	ln -sf /proc/1/fd/1 /var/log/apache2/access.log; \
	ln -sf /proc/1/fd/2 /var/log/apache2/error.log; \
	ln -sf /proc/1/fd/1 /var/log/apache2/other_vhosts_access.log; \
	echo 'Ok'


ADD files /src/files
ADD src/latest.zip /src/latest.zip

RUN cd ~; \
	mkdir -p /data; \
	cp -rf /src/files/etc/* /etc/; \
	cp -rf /src/files/root/* /root/; \
	rm -rf /src/files; \
	rm -rf /var/www/html; \
	chown -R www-data:www-data /var/www; \
	chmod +x /root/run.sh; \
	echo "Ok"

CMD ["/root/run.sh"]