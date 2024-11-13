packages=`cat packages.txt`
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install $packages

