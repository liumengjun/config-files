# note: use mysql in host
docker run --name zabbix-web-nginx-mysql -t \
      -e DB_SERVER_HOST="192.168.56.1" \
      -e MYSQL_DATABASE="zabbix" \
      -e MYSQL_USER="root" \
      -e MYSQL_PASSWORD="lmj" \
      -e MYSQL_ROOT_PASSWORD="lmj" \
      --link zabbix-server-mysql:zabbix-server \
      -p 10080:80 \
      -d zabbix/zabbix-web-nginx-mysql:latest