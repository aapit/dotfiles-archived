SCRDIR=$HOME/Scripts/
DOTDIR=$HOME/Scripts/dotfiles/
ENVDIR=$HOME/Scripts/dotfiles/shell/env/
source ${ENVDIR}language.sh
source ${ENVDIR}paths.sh

export EDITOR=/usr/bin/nvim

source ${ENVDIR}ssh_keys.sh
#source ~/Scripts/bash_env/ssh_connect_multiplexer.sh
source ${ENVDIR}aliases.sh
[ -f ${ENVDIR}tokens.sh ] && source ${ENVDIR}tokens.sh


# Interactive context
if [[ $- == *i* ]]; then
#    source ~/Scripts/bash_env/colors.sh
#    source ~/Scripts/bash_env/powerline.sh
#    source ~/Scripts/bash_env/prompt.sh
#    source ~/Scripts/bash_env/fzf.sh
    source ${ENVDIR}tmux.sh
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    source ~/Scripts/3rdparty/todoist-cli/todoist_functions.sh
#    source ~/Scripts/bash_env/autojump.sh
fi

export PATH="$HOME/.cargo/bin:$PATH"
