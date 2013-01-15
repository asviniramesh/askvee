#
#rvm install

curl -L get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm reload

sudo apt-get install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion -y -q


rvm install 1.9.2
rvm use ruby-1.9.2
gem install bundler
