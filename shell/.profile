ENVDIR=$HOME/Scripts/dotfiles/shell/env/
. ${ENVDIR}language.sh
. ${ENVDIR}paths.sh

export VISUAL="/usr/bin/emacsclient -c -n"
export EDITOR="/usr/bin/emacsclient -c -n"

. ${ENVDIR}ssh_keys.sh
#source ~/Scripts/bash_env/ssh_connect_multiplexer.sh
. ${ENVDIR}aliases.sh
[ -f ${ENVDIR}tokens.sh ] && source ${ENVDIR}tokens.sh


# Interactive context
if [[ $- == *i* ]]; then
#    source ~/Scripts/bash_env/colors.sh
#    source ~/Scripts/bash_env/powerline.sh
#    source ~/Scripts/bash_env/prompt.sh
#    source ~/Scripts/bash_env/fzf.sh
    . ${ENVDIR}tmux.sh
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    . ~/Scripts/3rdparty/todoist-cli/todoist_functions.sh
#    source ~/Scripts/bash_env/autojump.sh
fi

export PATH="$HOME/.cargo/bin:$PATH"
