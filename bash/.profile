source ~/Scripts/bash_env/language.sh
source ~/Scripts/bash_env/paths.sh

export EDITOR=/usr/bin/nvim

source ~/Scripts/bash_env/ssh_keys.sh
source ~/Scripts/bash_env/ssh_connect_multiplexer.sh
source ~/Scripts/bash_env/aliases.sh
[ -f ~/Scripts/bash_env/tokens.sh ] && source ~/Scripts/bash_env/tokens.sh


# Interactive context
if [[ $- == *i* ]]; then
    source ~/Scripts/bash_env/colors.sh
    source ~/Scripts/bash_env/powerline.sh
    source ~/Scripts/bash_env/prompt.sh
    source ~/Scripts/bash_env/fzf.sh
    source ~/Scripts/bash_env/tmux.sh
    source ~/Scripts/bash_env/autojump.sh
fi
