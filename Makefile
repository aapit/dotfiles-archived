.PHONY: all

build:
	brew bundle dump -f
	cp ~/.vimrc .
