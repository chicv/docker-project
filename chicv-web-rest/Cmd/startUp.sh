sudo service nginx start 
sudo service php7.1-fpm start 
sudo service elasticsearch  start 
sudo service redis-server start
sudo service mysql start 
sudo service  dnsmasq start

sudo cp /etc/resolv.conf /etc/resolv.conf.bak && sudo sed -i "s/^nameserver\ 127\.0\.0\.11/nameserver\ 127.0.0.1/" /etc/resolv.conf.bak && sudo cp /etc/resolv.conf.bak /etc/resolv.conf
