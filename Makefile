.PHONY: all

build:
	brew bundle dump -f
	cp ~/.vimrc .
	
	@# iterm2
	@echo 'Copy iterm2 plist'
	@cp ~/Library/Preferences/com.googlecode.iterm2.plist iterm2
	@echo 'Copy iterm2 config'
	@defaults read com.googlecode.iterm2 | tee iterm2/iterm2.config 1> /dev/null
