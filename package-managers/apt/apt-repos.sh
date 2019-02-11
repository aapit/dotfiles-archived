sudo apt install curl

# Signal for desktop repository
repo="deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main"
listfile="/etc/apt/sources.list.d/signal-xenial.list"
if ! grep -Fxq "$repo" $listfile; then
    curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
    echo "$signalrepo" | sudo tee -a $listfile
fi;

# Pomodoro app
repo="deb https://download.opensuse.org/repositories/home:/kamilprusko/xUbuntu_18.10/ /"
listfile="/etc/apt/sources.list.d/gnome-pomodoro.list"
if ! grep -Fxq "$repo" $listfile; then
    curl -s https://download.opensuse.org/repositories/home:/kamilprusko/xUbuntu_18.10/Release.key | sudo apt-key add -
    echo "$repo" | sudo tee -a $listfile
fi;

# Polo file manager
sudo apt-add-repository -y ppa:teejee2008/ppa

# UNetbootin (for usb boot disks)
sudo add-apt-repository ppa:gezakovacs/ppa

# Deepin window manager
sudo add-apt-repository ppa:leaeasy/dde 

sudo apt update
