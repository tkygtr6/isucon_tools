NGINX_CONF_TEMPLATE_PATH=$(cd $(dirname $0); pwd)/../confs/nginx

echo "NGINX_CONF_PATH?"
read NGINX_CONF_PATH

if [ ! -e $NGINX_CONF_TEMPLATE_PATH ]; then
    echo "$NGINX_CONF_TEMPLATE_PATH does not exist."
    exit 1
fi

mkdir -p $NGINX_CONF_PATH
echo "$NGINX_CONF_PATH created"

apt install nginx
systemctl enable nginx
systemctl start nginx

cp -r $NGINX_CONF_TEMPLATE_PATH/* $NGINX_CONF_PATH/

if [ -L /etc/nginx/conf.d ]; then
    echo "rm symbolic file /etc/nginx/conf.d"
    rm /etc/nginx/conf.d
else
    mv /etc/nginx/conf.d /etc/nginx/conf.d.bak
fi

if [ -L /etc/nginx/nginx.conf ]; then
    echo "rm symbolic file /etc/nginx/conf.conf"
    rm /etc/nginx/nginx.conf
else
    mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
fi

ln -s $NGINX_CONF_PATH/conf.d /etc/nginx/conf.d
ln -s $NGINX_CONF_PATH/nginx.conf /etc/nginx/nginx.conf

