source $HOME/Scripts/bash_env/paths.sh
source $BASH_SCRIPTS_DIR/language.sh

alias src="source $HOME/.profile"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f $XDG_CONFIG_HOME/yarn/global/node_modules/tabtab/.completions/serverless.bash ] && . $XDG_CONFIG_HOME/yarn/global/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f $XDG_CONFIG_HOME/yarn/global/node_modules/tabtab/.completions/sls.bash ] && . $XDG_CONFIG_HOME/yarn/global/node_modules/tabtab/.completions/sls.bash
[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash
