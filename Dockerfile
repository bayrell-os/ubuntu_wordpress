ARG ARCH=
FROM ${ARCH}ubuntu:focal

RUN cd ~; \
	export DEBIAN_FRONTEND='noninteractive'; \
	apt-get update; \
	apt-get install -y --no-install-recommends mc less nano wget pv zip unzip supervisor net-tools sudo apache2 php7.4 php7.4-common php7.4-mysql php7.4-gd php7.4-xml php7.4-zip php7.4-opcache python3 python3-pip; \
	apt-get clean; \
	echo 'Ok'


ADD files /src/files
ADD src/latest.zip /src/latest.zip

RUN cd ~; \
	mkdir -p /data; \
	cp -rf /src/files/etc/* /etc/; \
	cp -rf /src/files/root/* /root/; \
	rm -rf /src/files; \
	rm -rf /var/www/html; \
	chmod +x /root/run.sh; \
	echo "Ok"

CMD ["/root/run.sh"]