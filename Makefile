.PHONY: all

build:
	@#--- Homebrew
	brew bundle dump -f
	@#--- Python packages
	python3 -m pip list --format=freeze > ./python/python3-packages.txt
	python2 -m pip list --format=freeze > ./python/python2-packages.txt
	@#--- RubyGems
	gem list > ./ruby/gem-list.txt
	@#--- Vim 
	cp ~/.vimrc ./vim/
	cp -R ~/.config/nvim ./vim/.config/
	cp -R ~/.config/vim/config ./vim/.config/vim/
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
