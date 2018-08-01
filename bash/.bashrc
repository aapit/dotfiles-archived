# Lang
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Appearance
export CLICOLOR=1
## BSD (MacOS) ls colors
export LSCOLORS=GxFxCxDxBxhgedabagacad
## GNU ls colors
export LS_COLORS="no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;35:*.cmd=00;32:*.exe=00;32:*.sh=00;32:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.t=93:*.pm=00;36:*.pod=00;96:*.conf=00;33:*.off=00;9:*.jpg=00;94:*.png=00;94:*.xcf=00;94:*.JPG=00;94:*.gif=00;94:*.pdf=00;91"

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

