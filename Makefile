# @author David Spreekmeester <david@spreekmeester.nl> @aapit
.PHONY: all
OS_FLAG ::= $(shell uname -s)
TSTAMP ::= $(shell date "+%Y%m%d%H%M%S")
LINKCMD ::= ln -s -f --backup=existing --suffix=.bkp
SCRIPTS_DIR_S ?= ./bash/scripts
SCRIPTS_DIR_T ?= ~/Scripts
BASHRC_S ?= ./bash/.bashrc
BASHRC_T ?= ~
PROFILE_S ?= ./bash/.profile
PROFILE_T ?= ~
INPUTRC_S ?= ./.inputrc
INPUTRC_T ?= ~
VIMRC_S ?= ./vim/.vimrc
VIMRC_T ?= ~
VIMCONFIG_S ?= ./vim/.config
VIMCONFIG_T ?= ~/.config
VIM_COLORS_S ?= ./vim/colors
VIM_COLORS_T ?= ~/.vim/colors
GITCONFIG_S ?= ./git/.gitconfig
GITCONFIG_T ?= ~
TMUXCONF_S ?= ./tmux/.tmux.conf
TMUXCONF_T ?= ~
TMUXTHEMES_S ?= ./tmux/themes
TMUXTHEMES_T ?= ~/.config/tmux
TMUXINATOR_S ?= ./tmux/tmuxinator
TMUXINATOR_T ?= ~/.config
POWERLINE_S ?= ./powerline
POWERLINE_T ?= ~/.config
ITERM_PROFS_S ?= ./iterm2/iterm.dynamic_profiles.json
ITERM_PROFS_T ?= ~/Library/Application\ Support/iTerm2/DynamicProfiles
LYNX_CFG_S ?= ./lynx/lynx.cfg
LYNX_CFG_T ?= ~/.config

# Installs the dotfiles setup on the local instance
install: install_mac
	@echo ___ Bash
	${LINKCMD} -t ${BASHRC_T} $$(realpath ${BASHRC_S})
	${LINKCMD} -t ${PROFILE_T} $$(realpath ${PROFILE_S})
	for d in $$(/bin/ls ${SCRIPTS_DIR_S}/); \
		do ${LINKCMD} -t ${SCRIPTS_DIR_T} $$(realpath ${SCRIPTS_DIR_S}/$$d); done
	${LINKCMD} -t ${INPUTRC_T} $$(realpath ${INPUTRC_S})
	@echo ___ Vim
	${LINKCMD} -t ${VIMRC_T} $$(realpath ${VIMRC_S})
	for d in $$(/bin/ls ${VIMCONFIG_S}/); \
		do ${LINKCMD} -t ${VIMCONFIG_T} $$(realpath ${VIMCONFIG_S}/$$d); done
	[ -d ${VIM_COLORS_T} ] || mkdir -p ${VIM_COLORS_T}
	for d in $$(/bin/ls ${VIM_COLORS_S}/); \
		do ${LINKCMD} -t ${VIM_COLORS_T} $$(realpath ${VIM_COLORS_S}/$$d); done
	@echo ___ git
	${LINKCMD} -t ${GITCONFIG_T} $$(realpath ${GITCONFIG_S})
	@echo ___ tmux
	${LINKCMD} -t ${TMUXCONF_T} $$(realpath ${TMUXCONF_S})
	${LINKCMD} -t ${TMUXTHEMES_T} $$(realpath ${TMUXTHEMES_S}/)
	@echo ___ tmuxinator
	${LINKCMD} -t ${TMUXINATOR_T} $$(realpath ${TMUXINATOR_S})
	@echo ___ Powerline
	${LINKCMD} -t ${POWERLINE_T} $$(realpath ${POWERLINE_S})
	@echo ___ Lynx
	${LINKCMD} -t ${LYNX_CFG_T} $$(realpath ${LYNX_CFG_S})
	#sudo chown -h ${USER} ${LYNX_CFG_T}/lynx.cfg

install_mac:
ifeq ($(OS_FLAG),Darwin)
	@#--- iterm2
	[ -d ${ITERM_PROFS_DIR_T} ] && \
		{ ${LINKCMD} -t ${ITERM_PROFS_T} $(realpath ${ITERM_PROFS_S}) \
		;} || \
		echo "--> Note! iTerm dynamic profiles are not enabled."
endif
