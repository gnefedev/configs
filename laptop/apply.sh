packages=`cat packages.txt`

if [ ! -f "/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg" ]
then
    curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
fi

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install $packages

if [[ -n $(git status -s -uall) ]]
then
    git add *
    git commit -m 'update'
    git push
fi
