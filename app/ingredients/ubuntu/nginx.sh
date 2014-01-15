if [ ! -f ./templates/nginx/stages/$STAGE.conf ]; then
    echo "Please create the following config file: templates/nginx/stages/$STAGE.conf"
    exit
fi

echo "Install NGINX"
nginx -v >/dev/null 2>&1 || apt-get install nginx -y

echo "Dumping default site"
rm -f /etc/nginx/sites-enabled/default

echo "Copying nginx.conf template"
cp ./templates/nginx/nginx.conf /etc/nginx/nginx.conf

echo "Copying site file: $STAGE"
cp ./templates/nginx/stages/$STAGE.conf /etc/nginx/sites-available/$STAGE

echo "Enabling site file: $STAGE"
ln -s /etc/nginx/sites-available/$STAGE /etc/nginx/sites-enabled/$STAGE

echo "Creating webroot"
mkdir -pv $WEBROOT

echo "Copying coming soon page"
cp ./templates/nginx/index.html $WEBROOT/index.html

echo "Copying health check page"
cp ./templates/nginx/health.html $WEBROOT/health.html

echo "Change nginx ownership to root"
chown -R root:root /etc/nginx

echo "Restarting NGINX"
/etc/init.d/nginx restart