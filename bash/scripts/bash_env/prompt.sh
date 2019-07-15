BLACK=$'\[\033[1;30m\]'
WHITE=$'\[\033[1;37m\]'
BLUE=$'\[\033[1;34m\]'
GREEN=$'\[\033[0;32m\]'
YELLOW=$'\[\033[0;33m\]'
RED=$'\[\033[0;31m\]'
GREY=$'\[\033[0;37m\]'
DARKGREY=$'\[\033[0;30m\]'
CYAN=$'\033[0;36m'
MAGENTA=$'\033[0;35m'
NONE=$'\[\033[m\]'

source ~/Scripts/bash_env/prompt_helpers/nonzero_return.sh
source ~/Scripts/bash_env/prompt_helpers/parse_git_branch.sh
source ~/Scripts/bash_env/prompt_helpers/parse_git_dirty.sh

export PS1="${MAGENTA}C:\\${CYAN}\W${RED}\`nonzero_return\`${GREY}\`parse_git_branch '1;34'\`  ${NONE}\n> "
