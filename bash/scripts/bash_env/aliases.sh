# Various
alias top='sudo htop'
alias luxafor='~/Scripts/luxafor.sh'
alias bla='~/Scripts/generate-loremipsum.sh'

# Tasks
alias t='task'
alias tl='task list'
alias ta='task add'

# Using exa (in Rust) instead of ls
alias ls='exa --long --level=2 --all --group-directories-first --modified --git'
alias lsl='exa --long --tree --level=2 --all --group-directories-first --group --modified --git --header'

# Sourcing
alias src='. ~/.profile'
alias alias-edit="vim ~/Scripts/bash_env/aliases.sh && . ~/Scripts/bash_env/aliases.sh"

# Editing and reading
alias v="nvim"
alias vim="nvim"
alias cat='bat'
alias n='nvim -c "NV!"'
alias vim-color-edit='nvim ~/.vim/colors/spacemonkey_dark.vim'

# Clipboard
alias c="xclip -selection c"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias desk="cd ~/Desktop"
alias s=". ~/Scripts/bash_env/site-dir-change.sh"
alias ~="cd ~"

# Editing configurations
alias config-edit-tmux="(cd $HOME/.config/tmux && vim $HOME/.tmux.conf && cd -)"
alias config-edit-vim="(cd $HOME/.config/vim/config && vim -c 'FZF!' && cd -)"

# Capistrano
alias csd='cap staging deploy'
alias cpd='cap production deploy'

# Git
alias g='git'
alias gs='git status'
alias gc='git commit -m'
alias gl='git pull'
alias gp='git push'
alias ga='git add .'
alias dev='git co develop'
alias master='git co master'
alias git-push-upstream='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'

# iTerm profile switching, tmux proof
alias light='. ~/Scripts/interface/switch-to-light.sh'
alias dark='. ~/Scripts/interface/switch-to-dark.sh'

# Toggle function keys / Apple functions
alias fn-off='osascript ~/Scripts/interface/function-keys-off.applescript'
alias fn-on='osascript ~/Scripts/interface/function-keys-on.applescript'
alias fn-toggle='osascript ~/Scripts/interface/function-keys-on.applescript'

# Docker
alias dco='docker-compose'
alias dce='docker-compose exec'
alias dcr='docker-compose run'
alias dcup='docker-compose up'
alias docker-snafu='~/Scripts/docker/docker-snafu.sh'

# Kubernetes
alias k='kubectl'

# tmux
alias tmux='TERM=screen-256color tmux'
alias rn='tmux movew -r && tmux rename-window'

# icons
alias icons-replace='sudo sh ~/Scripts/replace-custom-icons.sh'
alias icons-edit="$EDITOR ~/Scripts/replace-custom-icons.sh"

# Packages
alias apt-edit-pkgs="vim $HOME/Scripts/dotfiles/package-managers/apt/apt-packages.txt"
alias apt-install-pkgs=". $HOME/Scripts/dotfiles/package-managers/apt/apt-install.sh"

# Vim
alias vimcfg="cd ~/.config/vim/config && vim . && cd -"

# Spotify
alias spotify="$(which spotify) --force-device-scale-factor=2 > /dev/null &"

# Todoist
alias todoist="~/Scripts/kill-todoist.sh; ~/Scripts/app-from-source/todoist-linux/dist/todoist-0.5.0-linux-x64/todoist 2> /dev/null &"
alias todoist-kill="~/Scripts/kill-todoist.sh"
alias kill-todoist="~/Scripts/kill-todoist.sh"
