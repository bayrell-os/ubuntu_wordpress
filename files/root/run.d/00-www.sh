if [ ! -z $WWW_UID ]; then
	sed -i "s|www-data:x:33:33:|www-data:x:$WWW_UID:$WWW_GID:|g" /etc/passwd
fi
if [ ! -z $WWW_GID ]; then
	sed -i "s|www-data:x:33:|www-data:x:$WWW_GID:|g" /etc/group
fi