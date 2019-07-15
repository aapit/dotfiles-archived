export TMUX_CONFIG_PATH=$HOME/.config/tmux/
export TMUX_PLUGIN_MANAGER_PATH=$HOME/.config/tmux/plugins/

[ -z "$TMUX" ] && export TERM=xterm-256color
[ -z "$TMUX" ] && exec tmux new -As 家に
