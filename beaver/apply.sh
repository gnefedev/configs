sudo add-apt-repository ppa:deadsnakes/ppa

packages=`cat packages.txt`
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install $packages

if ! command -v cloudflared >/dev/null 2>&1
then
    curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
    sudo dpkg -i cloudflared.deb
    rm cloudflared.deb
fi

if [[ -n $(git status -s -uall) ]]
then
    git add *
    git commit -m 'update'
    git push
fi
