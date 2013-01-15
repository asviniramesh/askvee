#redis
mkdir ~/redis
cd ~/redis
wget http://redis.googlecode.com/files/redis-2.4.13.tar.gz
 tar xzf redis-2.4.13.tar.gz
 cd redis-2.4.13
 make
sudo make install
#cp -pf redis-server /usr/local/bin
#cp -pf redis-benchmark /usr/local/bin
#cp -pf redis-cli /usr/local/bin
#cp -pf redis-check-dump /usr/local/bin
#cp -pf redis-check-aof /usr/local/bin


