source $HOME/.bashrc

source $BASH_SCRIPTS_DIR/powerline.sh
if [ -z $TMUX ]; then tmux a -t 家に || tmux new -s 家に; fi

complete -o default -F _g g

source $BASH_SCRIPTS_DIR/ssh_keys.sh
source $BASH_SCRIPTS_DIR/ssh_connect_multiplexer.sh
source $BASH_SCRIPTS_DIR/aliases.sh
[ -f $BASH_SCRIPTS_DIR/tokens.sh ] && source $BASH_SCRIPTS_DIR/tokens.sh
source $BASH_SCRIPTS_DIR/hstr_configuration.sh
source $BASH_SCRIPTS_DIR/autojump.sh

[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
