.PHONY: all
OS_FLAG:=$(shell uname -s)
SCRIPTS_DIR=~/Scripts
TIMESTAMP:=$(shell date "+%Y%m%d%H%M%S")

# Builds a 'snapshot' of the local configuration'
build: build_mac
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
	cp -R ${SCRIPTS_DIR}/bash_env ./bash/scripts/
	cp -R ${SCRIPTS_DIR}/interface ./bash/scripts/
	cp ~/.inputrc .
	@#--- tmux
	cp ~/.tmux.conf ./tmux
	@#--- tmuxinator
	cp -r ~/.config/tmuxinator/ ./tmux/tmuxinator
	@#--- Powerline
	cp -r ~/.config/powerline/ ./powerline

build_mac:
ifeq ($(OS_FLAG),Darwin)
	@#--- Homebrew
	brew bundle dump -f
	@#--- iterm2
	cp ~/Library/Application\ Support/iTerm2/DynamicProfiles/* iterm2/
endif

# Installs the dotfiles setup on the local instance
# Note! Potentially destructive
install: install_mac
	@#--- Bash
	test -f ~/.bashrc && cp ~/.bashrc ~/.bashrc_${TIMESTAMP} || true
	cp ./bash/.bashrc ~
	test -f ~/.bash_profile && cp ~/.bash_profile ~/.bash_profile_${TIMESTAMP} || true
	cp ./bash/.bash_profile ~
	test -d ${SCRIPTS_DIR}/bash_env || mkdir -p ${SCRIPTS_DIR}/bash_env
	cp -R ./bash/scripts/* ${SCRIPTS_DIR}
	test -f ~/.inputrc && cp ~/.inputrc ~/.inputrc_${TIMESTAMP} || true
	cp ./.inputrc ~
	@#--todo: Python
	@#--todo: Ruby
	@#--- Vim 
	test -f ~/.vimrc && cp ~/.vimrc ~/.vimrc_${TIMESTAMP} || true
	cp ./vim/.vimrc ~
	cp -R ./vim/.config/* ~/.config/
	@#--- tmux
	test -f ~/.tmux.conf && cp ~/.tmux.conf ~/.tmux.conf_${TIMESTAMP} || true
	cp ./tmux/.tmux.conf ~/.tmux.conf
	@#--- tmuxinator
	cp -r ./tmux/tmuxinator ~/.config/
	@#--- Powerline
	cp -r ./powerline ~/.config/

install_mac:
ifeq ($(OS_FLAG),Darwin)
	brew update && brew upgrade
	-brew bundle
endif

