sudo apt install curl

# Signal for desktop repository
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

# Polo file manager
sudo apt-add-repository -y ppa:teejee2008/ppa

sudo apt update
