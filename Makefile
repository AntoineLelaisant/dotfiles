install:
	mkdir -p /home/$$(whoami)/.config
	./scripts/yay
	./scripts/base
	./scripts/zsh
	./scripts/bspwm
	./scripts/kitty
	./scripts/php
	./scripts/composer
