if [ ! -d /data/wordpress ]; then
	mkdir /data/wordpress
fi
if [ ! -d /var/www/html ]; then
	ln -s /data/wordpress /var/www/html
fi
if [ -z "$(ls -A /var/www/html)" ]; then
	cd /var/www
	unzip /src/latest.zip > /dev/null
	mv wordpress/* html
	rmdir wordpress
	chown -R www-data:www-data /data/wordpress
	chown -R www-data:www-data /var/www
fi