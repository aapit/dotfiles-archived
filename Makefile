.PHONY: all

build:
	@#--- Homebrew
	brew bundle dump -f
	@#--- Vim 
	cp ~/.vimrc .
	@#--- iterm2
	@echo 'Copying iterm2 plist...'
	cp ~/Library/Preferences/com.googlecode.iterm2.plist iterm2
	@echo 'Copying iterm2 config...'
	defaults read com.googlecode.iterm2 | tee iterm2/iterm2.config 1> /dev/null
	@#--- tmux / byobu
	cp ~/.tmux.conf .
