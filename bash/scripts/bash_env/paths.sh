export GOPATH=/usr/local/opt/golang
export GOROOT=/usr/local/opt/go/libexec
export GEM_HOME=$HOME/.gem
export PYTHONPATH=$HOME/.local/lib/python3/site-packages:/usr/lib/python3/dist-packages
export XDG_CONFIG_HOME="$HOME/.config"
export BASH_SCRIPTS_DIR=$HOME/Scripts/bash_env

PATH=$PATH:\
./vendor/bin:\
./node_modules/.bin:\
$HOME/.yarn/bin:\
$HOME/.local/bin:\
/usr/local/sbin:\
/usr/local/bin:\
/usr/bin:\
/bin:\
/usr/sbin/:\
/sbin:\
$GEM_HOME/bin:\
$HOME/.composer/vendor/bin:\
$GOPATH/bin:\
$GOROOT/bin:\
$PYTHONPATH:\
$HOME/.rvm/bin
