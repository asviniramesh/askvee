#openresty
sudo apt-get install libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl -y

mkdir ~/ngx
cd ~/ngx
wget http://agentzh.org/misc/nginx/ngx_openresty-1.0.11.28.tar.gz
tar xzvf ngx_openresty-1.0.11.28.tar.gz
cd ngx_openresty-1.0.11.28
./configure --with-luajit
make 
sudo make install
cd ~
# installed in /usr/local/openresty/
#nginx binary in /usr/local/openresty/nginx/sbin/nginx
