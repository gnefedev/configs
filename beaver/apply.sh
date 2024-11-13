packages=`cat packages.txt`
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install $packages

if command -v git >/dev/null 2>&1
then
    echo "git is installed and in PATH"
else
    echo "git is not installed or not in PATH"
fi

if [[ -n $(git status -s -uall) ]]
then
    git add *
    git commit -m 'update'
    git push
fi
