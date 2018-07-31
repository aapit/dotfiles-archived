.PHONY: all

build:
	@#--- Homebrew
	brew bundle dump -f
	@#--- Vim 
	cp ~/.vimrc .
	@#--- Bash
	cp ~/.bashrc ./bash
	cp ~/.bash_profile ./bash
	cp -R ~/Scripts/bash_env ./bash/
	cp -R ~/Scripts/interface ./bash/
	cp ~/.inputrc .
	@#--- iterm2
	cp ~/Library/Application\ Support/iTerm2/DynamicProfiles/* iterm2/
	@#--- tmux
	cp ~/.tmux.conf ./tmux
	@#--- tmuxinator
	cp -r ~/.config/tmuxinator/ ./tmux/tmuxinator
	@#--- Powerline
	cp -r ~/.config/powerline/ ./powerline
