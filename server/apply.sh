packages=`cat packages.txt`
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install $packages

if [[ -n $(git status -s) ]]
then
    git add *
    git commit -m 'update'
    git push
fi
