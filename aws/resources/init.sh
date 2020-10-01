#!/bin/bash
#Amazon Linux 2 AMI
#source : https://gist.github.com/npearce/6f3c7826c7499587f00957fee62f8ee9
# INSTALL DOCKER
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user

#MAKE DOCKER AUTO-START
sudo chkconfig docker on

#INSTALL GIT
sudo yum install -y git

# INSTALL DOCKER-COMPOSE
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

#FIX PERMISSIONS
sudo chmod +x /usr/local/bin/docker-compose

#FIX PERMISSIONS
sudo chmod 666 /var/run/docker.sock

#COPYING DOCKER COMPOSE FILE AND ENVIRONMENT FILES
mkdir -p /opt/csgo

cat << 'EOF' > /opt/csgo/docker-compose.yml
${docker_compose_conf}
EOF

cat << 'EOF' > /opt/csgo/.env
TOKEN=${csgo_token_game}
HOSTNAME=${csgo_hostname}
IP="${csgo_ip}"
PUBLIC_IP="${csgo_public_ip}"
PW=${csgo_pwd}
RCONPW=${csgo_rconpw}
PORT=${csgo_port}
TV_PORT=${csgo_tv_port}
MAP=${csgo_map}
MAX_PLAYERS=${csgo_max_players}
GAMETYPE=${csgo_gametype}
GAMEMODE=${csgp_gamemode}
EOF
