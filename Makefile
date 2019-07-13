# @author David Spreekmeester <david@spreekmeester.nl> @aapit
.PHONY: all
OS_FLAG ::= $(shell uname -s)
TSTAMP ::= $(shell date "+%Y%m%d%H%M%S")
LINKCMD ::= ln -s -f --backup=existing --suffix=.bkp
SCRIPTS_DIR ?= ~/Scripts
BASHRC ?= ~/.bashrc
PROFILE ?= ~/.profile
INPUTRC ?= ~/.inputrc
VIMRC ?= ~/.vimrc
GITCONFIG ?= ~/.gitconfig
VIMCONFIG ?= ~/.config
BASHENVSCR_DIR ?= ${SCRIPTS_DIR}/bash_env
TMUXCONF ?= ~/.tmux.conf
TMUXINATOR ?= ~/.config/tmuxinator
POWERLINE ?= ~/.config/powerline
VIM_COLORS ?= ~/.vim/colors
ITERM_PROFS_DIR ?= ~/Library/Application\ Support/iTerm2/DynamicProfiles
ITERM_PROFS ?= iterm.dynamic_profiles.json


# Installs the dotfiles setup on the local instance
install: install_mac
	@echo ___ Bash
	${LINKCMD} $(realpath ./bash/.bashrc) ${BASHRC}
	${LINKCMD} $(realpath ./bash/.profile) ${PROFILE}
	for d in $(/bin/ls ./bash/scripts/); \
		do ${LINKCMD} $(realpath $d) ${SCRIPTS_DIR}/$d; done
	${LINKCMD} $(realpath ./.inputrc) ${INPUTRC}
	@echo ___ Vim
	${LINKCMD} $(realpath ./vim/.vimrc) ${VIMRC}
	for d in $(/bin/ls ./vim/.config/); \
		do ${LINKCMD} $(realpath $d) ${VIMCONFIG}/$d; done
	[ -d ${VIM_COLORS} ] || mkdir -p ${VIM_COLORS}
	for d in $(/bin/ls ${VIM_COLORS}/); \
		do ${LINKCMD} $(realpath $d) ${VIM_COLORS}/$d; done
	@echo ___ git
	${LINKCMD} $(realpath ./git/.gitconfig) ${GITCONFIG}
	@echo ___ tmux && true
	${LINKCMD} $(realpath ./tmux/.tmux.conf) ${TMUXCONF}
	@echo ___ tmuxinator && true
	${LINKCMD} $(realpath ./tmux/tmuxinator) ${TMUXINATOR}
	@echo ___ Powerline && true
	${LINKCMD} $(realpath ./powerline) ${POWERLINE}

install_mac:
ifeq ($(OS_FLAG),Darwin)
	@#--- iterm2
	[ -d ${ITERM_PROFS_DIR} ] && \
		{ ${LINKCMD} $(realpath ./iterm/${ITERM_PROFS}) \
		${ITERM_PROFS_DIR)/${ITERM_PROFS} ;} || \
		echo "--> Note! iTerm dynamic profiles are not enabled."
endif
