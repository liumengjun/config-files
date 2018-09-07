# note: use mysql in host
docker run --name zabbix-server-mysql -t \
      -e DB_SERVER_HOST="192.168.56.1" \
      -e MYSQL_DATABASE="zabbix" \
      -e MYSQL_USER="root" \
      -e MYSQL_PASSWORD="lmj" \
      -e MYSQL_ROOT_PASSWORD="lmj" \
      -e ZBX_JAVAGATEWAY="zabbix-java-gateway" \
      --link zabbix-java-gateway:zabbix-java-gateway \
      -p 10051:10051 \
      -d zabbix/zabbix-server-mysql:latest