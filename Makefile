# @author David Spreekmeester <david@spreekmeester.nl> @aapit
.PHONY: all
OS_FLAG ::= $(shell uname -s)
TSTAMP ::= $(shell date "+%Y%m%d%H%M%S")
LINKCMD ::= ln -s -f --backup=existing --suffix=.bkp
SCRIPTS_DIR_S ?= ./bash/scripts
SCRIPTS_DIR_T ?= ~/Scripts
BASHRC_S ?= ./bash/.bashrc
BASHRC_T ?= ~/.bashrc
PROFILE_S ?= ./bash/.profile
PROFILE_T ?= ~/.profile
INPUTRC_S ?= ./.inputrc
INPUTRC_T ?= ~/.inputrc
VIMRC_S ?= ./vim/.vimrc
VIMRC_T ?= ~/.vimrc
GITCONFIG_S ?= ./git/.gitconfig
GITCONFIG_T ?= ~/.gitconfig
VIMCONFIG_S ?= ./vim/.config
VIMCONFIG_T ?= ~/.config
TMUXCONF_S ?= ./tmux/.tmux.conf
TMUXCONF_T ?= ~/.tmux.conf
TMUXTHEMES_S ?= ./tmux/themes
TMUXTHEMES_T ?= ~/.config/tmux/themes
TMUXINATOR_S ?= ./tmux/tmuxinator
TMUXINATOR_T ?= ~/.config/tmuxinator
POWERLINE_S ?= ./powerline
POWERLINE_T ?= ~/.config/powerline
VIM_COLORS_S ?= ./vim/colors
VIM_COLORS_T ?= ~/.vim/colors
ITERM_PROFS_DIR_S ?= ./iterm2
ITERM_PROFS_DIR_T ?= ~/Library/Application\ Support/iTerm2/DynamicProfiles
ITERM_PROFS ?= iterm.dynamic_profiles.json


# Installs the dotfiles setup on the local instance
install: install_mac
	@echo ___ Bash
	${LINKCMD} $$(realpath ${BASHRC_S}) ${BASHRC_T}
	${LINKCMD} $$(realpath ${PROFILE_S}) ${PROFILE_T}
	for d in $$(/bin/ls ${SCRIPTS_DIR_S}/); \
		do ${LINKCMD} $$(realpath ${SCRIPTS_DIR_S}/$$d/) ${SCRIPTS_DIR_T}/$$d; done
	${LINKCMD} $$(realpath ${INPUTRC_S}) ${INPUTRC_T}
	@echo ___ Vim
	${LINKCMD} $$(realpath ${VIMRC_S}) ${VIMRC_T}
	for d in $$(/bin/ls ${VIMCONFIG_S}/); \
		do ${LINKCMD} $$(realpath ${VIMCONFIG_S}/$$d) ${VIMCONFIG_T}/$$d; done
	[ -d ${VIM_COLORS_T} ] || mkdir -p ${VIM_COLORS_T}
	for d in $$(/bin/ls ${VIM_COLORS_S}/); \
		do ${LINKCMD} $$(realpath ${VIM_COLORS_S}/$$d) ${VIM_COLORS_T}/$$d; done
	@echo ___ git
	${LINKCMD} $$(realpath ${GITCONFIG_S}) ${GITCONFIG_T}
	@echo ___ tmux
	${LINKCMD} $$(realpath ${TMUXCONF_S}) ${TMUXCONF_T}
	${LINKCMD} $$(realpath ${TMUXTHEMES_S}/) ${TMUXTHEMES_T}
	@echo ___ tmuxinator
	${LINKCMD} $$(realpath ${TMUXINATOR_S}) ${TMUXINATOR_T}
	@echo ___ Powerline
	${LINKCMD} $$(realpath ${POWERLINE_S}) ${POWERLINE_T}

install_mac:
ifeq ($(OS_FLAG),Darwin)
	@#--- iterm2
	[ -d ${ITERM_PROFS_DIR_T} ] && \
		{ ${LINKCMD} $(realpath ${ITERM_PROFS_DIR_S}/${ITERM_PROFS}) \
		${ITERM_PROFS_DIR_T)/${ITERM_PROFS} ;} || \
		echo "--> Note! iTerm dynamic profiles are not enabled."
endif
