# docker-compose-files

Some of my Docker Images as follows
https://hub.docker.com/u/uzrnem


docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.State}}\t{{.Ports}}\t{{.ID}}"

docker save -o fsdf.tar images:latest

docker load -i fsdf.tar

docker cp nginx:/etc/nginx/conf.d/default.conf ./default.conf

docker-compose up -d web
