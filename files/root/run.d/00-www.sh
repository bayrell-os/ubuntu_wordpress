if [ ! -z $WWW_UID ] && [ ! -z $WWW_GID ]; then
	sed -i "s|www-data:x:33:|www-data:x:$WWW_GID:|g" /etc/group
	sed -i "s|www-data:x:33:33:|www-data:x:$WWW_UID:$WWW_GID:|g" /etc/passwd
	chown -R www-data:www-data /var/www
fi