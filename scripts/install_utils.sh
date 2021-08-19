sudo apt update
sudo apt install -y git jq nmap htop vim curl wget unzip gcc python3-dev libmysqlclient-dev python3-dev libmysqlclient-dev fish

# install netdata
bash <(curl -Ss https://my-netdata.io/kickstart.sh) all --dont-wait
sudo systemctl stop firewalld.service
sudo systemctl disable firewalld.service

# if installation of netdata fails
# sudo add-apt-repository ppa:phusion.nl/misc && sudo apt update && sudo apt install netdata
# sudo vim /etc/netdata/netdata.conf # change bind-address to 0.0.0.0
# sudo systemctl enable netdata && sudo systemctl restart netdata
