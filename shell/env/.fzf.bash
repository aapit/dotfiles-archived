# Setup fzf
# ---------
if [[ ! "$PATH" == */home/david/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/david/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/david/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/david/.fzf/shell/key-bindings.bash"
