install:
	mkdir -p /home/$$(whoami)/.config
	./scripts/yay
	./scripts/base
	./scripts/bspwm
	./scripts/php
	./scripts/composer
