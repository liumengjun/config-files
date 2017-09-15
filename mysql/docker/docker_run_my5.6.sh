# my.cnf is in $PWD/conf, data and logs are empty directory
docker run -p 23306:3306 --name mysql5.6-test -v $PWD/conf:/etc/mysql -v $PWD/logs:/logs -v $PWD/data:/mysql_data -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.6
