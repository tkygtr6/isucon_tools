git pull

sudo apt install -y git jq nmap htop vim curl wget unzip gcc

# install netdata
bash <(curl -Ss https://my-netdata.io/kickstart.sh) all --dont-wait
sudo systemctl stop firewalld.service
sudo systemctl disable firewalld.service

