sudo apt install curl

# Signal for desktop repository
signalrepo="deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main"
if ! grep -Fxq "$signalrepo" /etc/apt/sources.list.d/signal-xenial.list; then
    curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
    echo "$signalrepo" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
fi;

# Polo file manager
sudo apt-add-repository -y ppa:teejee2008/ppa

sudo apt update
