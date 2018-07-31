alias ls='LS_COLORS="no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;35:*.cmd=00;32:*.exe=00;32:*.sh=00;32:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.t=93:*.pm=00;36:*.pod=00;96:*.conf=00;33:*.off=00;9:*.jpg=00;94:*.png=00;94:*.xcf=00;94:*.JPG=00;94:*.gif=00;94:*.pdf=00;91" /usr/local/opt/coreutils/libexec/gnubin/ls --group-directories-first -Ahl --color=tty'

alias src='. ~/.bash_profile'
alias a="atom ."
alias alias-edit="vim ~/Scripts/bash_env/aliases.sh && . ~/Scripts/bash_env/aliases.sh"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
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
alias light='osascript ~/Scripts/interface/switch-to-light.applescript'
alias dark='osascript ~/Scripts/interface/switch-to-dark.applescript'

# Toggle function keys / Apple functions
alias fn-off='osascript ~/Scripts/interface/function-keys-off.applescript'
alias fn-on='osascript ~/Scripts/interface/function-keys-on.applescript'
alias fn-toggle='osascript ~/Scripts/interface/function-keys-on.applescript'

# Docker
alias dss='docker-sync-stack start'

# tmux
alias tmux='TERM=screen-256color tmux'
