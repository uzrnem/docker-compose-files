# docker-compose-files


## My docker images
Some of my Docker Images as follows
https://hub.docker.com/u/uzrnem

Phinx (db migration tool written in PHP): https://hub.docker.com/r/uzrnem/phinx

Camunda (workflow management tool Java): https://hub.docker.com/r/uzrnem/camunda

RedisGUI (Gui for Redis in NodeJS, VueJS): https://hub.docker.com/r/uzrnem/redisgui


## Few Important commands
docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.State}}\t{{.Ports}}\t{{.ID}}"

docker save -o fsdf.tar images:latest

docker load -i fsdf.tar

docker cp nginx:/etc/nginx/conf.d/default.conf ./default.conf

docker-compose up -d web
