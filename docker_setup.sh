echo "Installing Docker, Docker-compose and Portainer"


countdown()
(
  IFS=:
  set -- $*
  secs=$(( ${1#0} * 3600 + ${2#0} * 60 + ${3#0} ))
  while [ $secs -gt 0 ]
  do
     sleep 1 &
     printf "\r%02d:%02d:%02d" $((secs/3600)) $(( (secs/60)%60)) $((secs%60))
     secs=$(( $secs - 1 ))
     wait
  done
  echo
)

function checkit()
{
	ps auxw | grep -P '\b'$1'(?!-)\b' >/dev/null
	if [ $? != 0 ]
        then
            echo $1" Service is not running";
	else
	    echo $1"Service is running";
	fi;
}

sudo apt update

curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh

sudo systemctl restart docker

countdown "00:00:05"

checkit "docker"


sudo apt-get install -y libffi-dev libssl-dev
sudo apt install -y python3-dev
sudo apt-get install -y python3 python3-pip

sudo pip3 install docker-compose

docker-compose --version

countdown "00:00:10"

docker volume create portainer_data

docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

countdown "00:00:30"

curl -I localhost:9000
