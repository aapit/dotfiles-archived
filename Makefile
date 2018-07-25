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
	@#--- iterm2
	@echo 'Copying iterm2 plist...'
	cp ~/Library/Preferences/com.googlecode.iterm2.plist iterm2
	@echo 'Copying iterm2 config...'
	defaults read com.googlecode.iterm2 | tee iterm2/iterm2.config 1> /dev/null
	@#--- tmux / byobu
	cp ~/.tmux.conf ./tmux
	@#--- tmuxinator
	cp -r ~/.config/tmuxinator/ ./tmux/tmuxinator
