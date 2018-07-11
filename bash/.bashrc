source ~/Scripts/bash_env/prompt.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxhgedabagacad
export TERM=xterm-256color
export EDITOR=/usr/bin/vim
export VIM_APP_DIR=/Applications
export GOPATH=/usr/local/opt/golang
export GOROOT=/usr/local/opt/go/libexec
export APPLICATION_ENV=development


PATH=$PATH:\
./vendor/bin:\
./node_modules/.bin:\
/usr/local/sbin:\
/usr/local/bin:\
/usr/bin:\
/bin:\
/usr/sbin/:\
/sbin:\
$GEM_HOME:\
$HOME/.composer/vendor/bin:\
$GOPATH/bin:\
$GOROOT/bin:\
$HOME/.rvm/bin

complete -o default -F _g g

source ~/Scripts/bash_env/ssh_keys.sh
source ~/Scripts/bash_env/aliases.sh

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
