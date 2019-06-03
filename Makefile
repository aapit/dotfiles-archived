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
build: upgrade_package_managers build_mac
	@#--- Python packages
	pip3 list --format=freeze > ./python/python3-packages.txt
	pip2 list --format=freeze > ./python/python2-packages.txt
	@#--- RubyGems
	gem list > ./ruby/gem-list.txt
	@#--- Vim 
	cp ~/.vimrc ./vim/
	cp -R ~/.config/nvim ./vim/.config/
	cp -R ~/.config/vim/config ./vim/.config/vim/
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
	@#--- Homebrew
	brew bundle dump -f
	@#--- iterm2
	[ -d ~/Library/Application\ Support/iTerm2/DynamicProfiles ] \
	&& cp ~/Library/Application\ Support/iTerm2/DynamicProfiles/* iterm2/ \
	|| echo "--> Note! iTerm dynamic profiles are not enabled."
endif

# Installs the dotfiles setup on the local instance
# Note! Potentially destructive
install: upgrade_package_managers install_mac
	@#--- Bash
	test -f ~/.bashrc && cp ~/.bashrc ~/.bashrc_${TIMESTAMP} || true
	cp ./bash/.bashrc ~
	test -f ~/.profile && cp ~/.profile ~/.profile_${TIMESTAMP} || true
	cp ./bash/.profile ~
	test -d ${SCRIPTS_DIR}/bash_env || mkdir -p ${SCRIPTS_DIR}/bash_env
	cp -R ./bash/scripts/* ${SCRIPTS_DIR}
	test -f ~/.inputrc && cp ~/.inputrc ~/.inputrc_${TIMESTAMP} || true
	cp ./.inputrc ~
	@#--- Python
	pip3 install --user --trusted-host=pypi.python.org -r ./python/python3-packages.txt
	pip2 install --user --trusted-host=pypi.python.org -r ./python/python2-packages.txt
	@#--- Ruby
	while read gem; do gem install `echo $$gem | sed 's/.(.*)//g'`; done < ./ruby/gem-list.txt
	@#--- Vim 
	test -f ~/.vimrc && cp ~/.vimrc ~/.vimrc_${TIMESTAMP} || true
	cp ./vim/.vimrc ~
	cp -R ./vim/.config/* ~/.config/
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

install_mac: 
ifeq ($(OS_FLAG),Darwin)
	-brew bundle
endif

upgrade_package_managers:
ifeq ($(OS_FLAG),Darwin)
	brew update && brew upgrade
endif
	# Upgrade pip for TLS issues, without pip
	-curl https://bootstrap.pypa.io/get-pip.py | python2
	-curl https://bootstrap.pypa.io/get-pip.py | python3
