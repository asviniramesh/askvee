README



#install vagrant 

gem install vagrant


#install virtualbox

sudo apt-get install virtualbox


# ask sysadmin to add the base boxes /boxes/ folder and add them to vagrant


#boot the vagrant instance

vagrant up

# 
# install all the dependency manually

vagrant ssh 

#ssh into the vps

# usual prompt would be like this

# vagrant@vagrant-ubuntu-precise:

cd /vagrant

cd install

#install the commands needed to setup your server
# update packages and sources , git

sh base.sh

# install mysql if needed

sh mysql.sh

# install rvm and ruby-1.9.2

sh rvm_ruby192.sh


#  take help from sysadmin to install postgres as it requires changing configuration manually and as a priviledged user

sh postgres.sh


