echo "Installing PHP-FPM and other utilities"
apt-get install php5-fpm php5-cli php5-mysql php5-dev php5-gd php5-mcrypt mysql-client php5-curl php-apc php-pear build-essential libpcre3-dev -y

echo "Copying php-fpm.conf template"
cp ./templates/php/php-fpm.conf /etc/php5/fpm/php-fpm.conf

echo "Copying php.ini template"
cp ./templates/php/php.ini /etc/php5/fpm/php.ini

echo "Copying www.conf pool.d template"
cp ./templates/php/www.conf /etc/php5/fpm/pool.d/www.conf

echo "Changing ownership of php-fpm to root"
chown -R root:root /etc/php5/fpm

echo "Restarting PHP-FPM"
/etc/init.d/php5-fpm restart