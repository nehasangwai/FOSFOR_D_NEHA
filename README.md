# FOSFOR_D_NEHA

INSTALL DOCKER AND DOCKER COMPOSE:
docker version
docker-compose version

Pull the images:
docker pull fosfordevops/csvgenerator:latest
docker pull prom/prometheus:v2.22.0

Clone the repo:
git clone https://github.com/Fosfor-DevOps/appserver.git

docker images
Run the docker container:
docker run -d -i fosfordevops/csvgenerator:latest
docker ps
docker ps -a

Error:
docker logs ed33d1abc07d
2021/09/21 08:21:37 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory

Create a shell script to create the inputFile
#!/bin/bash
i=1
while :
do
        random=$(date +%s)
        echo "$i,$random" >> /root/FOSFOR/appserver/solution/inputfile
        i=$((i+1))
done

Run the cotainer by mouting the inputfile path
docker run -d -v /root/FOSFOR/appserver/solution/inputFile:/csvserver/inputdata fosfordevops/csvgenerator:latest

Login to the container
docker exec -it 64366bfc015a bash
Check the port
netstat -tlunp 
              
Stop the running container
docker stop 64366bfc015a

Run the container and provide the port mapping
docker run -d -i -v /root/FOSFOR/appserver/solution/csvserver/inputFile:/csvserver/inputdata -p 9393:9300 fosfordevops/csvgenerator:latest
Stop the container
docker stop 8f50ea53c0d0

ENV VAR:
docker run -d -i -v /root/FOSFOR/appserver/solution/csvserver/inputFile:/csvserver/inputdata -p 9393:9300 -e CSVSERVER_BORDER='Orange'fosfordevops/csvgenerator:latest
