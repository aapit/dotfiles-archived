alias ls='/bin/ls -Ahl'
alias src='. ~/.bash_profile'
#alias composer='composer.phar'
alias ..="cd .."
alias ...="cd ../.."
alias a="atom ."
alias desk="cd ~/Desktop"
alias s=". ~/Scripts/bash_env/site-dir-change.sh"

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
alias light='osascript ~/Scripts/switch-to-light.applescript'
alias dark='osascript ~/Scripts/switch-to-dark.applescript'

# Docker
alias dss='docker-sync-stack start'

# tmux
alias tmux='TERM=screen-256color tmux'
