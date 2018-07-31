# Lang
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Appearance
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxhgedabagacad

# Editor
export EDITOR=/usr/bin/vim
export VIM_APP_DIR=/Applications

# Platform
export GOPATH=/usr/local/opt/golang
export GOROOT=/usr/local/opt/go/libexec
export APPLICATION_ENV=development
export GEM_HOME=$HOME/.gem

[ -z "$TMUX" ] && export TERM=xterm-256color

PATH=$PATH:\
./vendor/bin:\
./node_modules/.bin:\
/usr/local/opt/coreutils/libexec/gnubin/:\
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
$HOME/.rvm/bin

