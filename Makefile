# @author David Spreekmeester <david@spreekmeester.nl>
.PHONY: all
OS_FLAG:=$(shell uname -s)
SCRIPTS_DIR=~/Scripts
TIMESTAMP:=$(shell date "+%Y%m%d%H%M%S")

info:
	@echo "Choose one of the following actions:"
	@echo "- build"
	@echo "- install"

# Builds a 'snapshot' of the local configuration'
build: build_mac
	@#--- Vim 
	cp ~/.vimrc ./vim/
	cp -R ~/.config/nvim ./vim/.config/
	cp -R ~/.config/vim/config ./vim/.config/vim/
	cp ~/.vim/colors/*.vim ./vim/colors/
	@#--- Bash
	cp ~/.bashrc ./bash
	cp ~/.profile ./bash
	cp -R ${SCRIPTS_DIR}/bash_env ./bash/scripts/
	cp -R ${SCRIPTS_DIR}/interface ./bash/scripts/
	cp ~/.inputrc .
	@#--- git
	cp ~/.gitconfig ./git/
	@#--- tmux
	cp ~/.tmux.conf ./tmux
	@#--- tmuxinator
	cp -r ~/.config/tmuxinator/ ./tmux/tmuxinator
	@#--- Powerline
	cp -r ~/.config/powerline/ ./powerline

build_mac:
ifeq ($(OS_FLAG),Darwin)
	@#--- iterm2
	[ -d ~/Library/Application\ Support/iTerm2/DynamicProfiles ] \
	&& cp ~/Library/Application\ Support/iTerm2/DynamicProfiles/* iterm2/ \
	|| echo "--> Note! iTerm dynamic profiles are not enabled."
endif

# Installs the dotfiles setup on the local instance
# Note! Potentially destructive
install:
	@#--- Bash
	test -f ~/.bashrc && cp ~/.bashrc ~/.bashrc_${TIMESTAMP} || true
	cp ./bash/.bashrc ~
	test -f ~/.profile && cp ~/.profile ~/.profile_${TIMESTAMP} || true
	cp ./bash/.profile ~
	test -d ${SCRIPTS_DIR}/bash_env || mkdir -p ${SCRIPTS_DIR}/bash_env
	cp -R ./bash/scripts/* ${SCRIPTS_DIR}
	test -f ~/.inputrc && cp ~/.inputrc ~/.inputrc_${TIMESTAMP} || true
	cp ./.inputrc ~
	@#--- Vim 
	test -f ~/.vimrc && cp ~/.vimrc ~/.vimrc_${TIMESTAMP} || true
	cp ./vim/.vimrc ~
	cp -R ./vim/.config/* ~/.config/
	[ -d ~/.vim/colors ] || mkdir -p ~/.vim/colors
	cp ./vim/colors/* ~/.vim/colors/
	@#--- git
	test -f ~/.gitconfig && cp ~/.gitconfig ~/.gitconfig_${TIMESTAMP} || true
	cp ./git/.gitconfig ~
	@#--- tmux
	test -f ~/.tmux.conf && cp ~/.tmux.conf ~/.tmux.conf_${TIMESTAMP} || true
	cp ./tmux/.tmux.conf ~/.tmux.conf
	@#--- tmuxinator
	cp -r ./tmux/tmuxinator ~/.config/
	@#--- Powerline
	cp -r ./powerline ~/.config/
