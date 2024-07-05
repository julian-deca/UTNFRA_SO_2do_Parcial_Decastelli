cd UTN-FRA_SO_Examenes/202406/docker/
mkdir web1 }
mkdir web1
mv index.html web1/
cd web1/
vim Dockerfile
mv web1/Dockerfile .
sudo docker build -t web1-decastelli:v1 .
