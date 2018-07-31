source $HOME/.bashrc

# Powerline
powerline-daemon -q 
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

if [ -z $TMUX ]; then tmux a -t home || tmux new -s home; fi

complete -o default -F _g g

source ~/Scripts/bash_env/ssh_keys.sh
source ~/Scripts/bash_env/ssh_connect_multiplexer.sh
source ~/Scripts/bash_env/aliases.sh

[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

