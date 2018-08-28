# Tasks
alias t='task'
alias tl='task list'
alias ta='task add'

# Using GNU ls with dirs on top and elaborate coloring
alias ls='/usr/local/opt/coreutils/libexec/gnubin/ls --group-directories-first -Ahl --color=tty'

# Sourcing
alias src='. ~/.bash_profile'
alias alias-edit="vim ~/Scripts/bash_env/aliases.sh && . ~/Scripts/bash_env/aliases.sh"

# Editing
alias v="nvim"
alias vim="nvim"
alias a="atom ."

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias desk="cd ~/Desktop"
alias s=". ~/Scripts/bash_env/site-dir-change.sh"
alias ~="cd ~"

# Capistrano
alias csd='cap staging deploy'
alias cpd='cap production deploy'

# Git
alias gs='git status'
alias gc='git ci -m'
alias gl='git pull'
alias gp='git push'
alias ga='git add .'
alias dev='git co develop'
alias master='git co master'
alias git-push-upstream='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'

# iTerm profile switching, tmux proof
alias light='osascript ~/Scripts/interface/switch-to-light.applescript'
alias dark='osascript ~/Scripts/interface/switch-to-dark.applescript'

# Toggle function keys / Apple functions
alias fn-off='osascript ~/Scripts/interface/function-keys-off.applescript'
alias fn-on='osascript ~/Scripts/interface/function-keys-on.applescript'
alias fn-toggle='osascript ~/Scripts/interface/function-keys-on.applescript'

# Docker
alias dco='docker-compose'
alias dce='docker-compose exec'
alias dcr='docker-compose run'
alias dcup='docker-compose up'
alias dss='docker-sync-stack start'

# tmux
alias tmux='TERM=screen-256color tmux'

# icons
alias icons-replace='sudo sh ~/Scripts/replace-custom-icons.sh'
alias icons-edit="$EDITOR ~/Scripts/replace-custom-icons.sh"
