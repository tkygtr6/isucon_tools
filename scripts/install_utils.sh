git pull

sudo apt update
sudo apt install -y git jq nmap htop vim curl wget unzip gcc python3-dev libmysqlclient-dev

# install netdata
bash <(curl -Ss https://my-netdata.io/kickstart.sh) all --dont-wait
sudo systemctl stop firewalld.service
sudo systemctl disable firewalld.service

