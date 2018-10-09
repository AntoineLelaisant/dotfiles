install:
	sh ./bash/install
	sh ./php/install
	sh ./composer/install
	sh ./fonts/install
	sh ./git/install
	sh ./vim/install
	sh ./tmux/install
	sh ./node/install
	sh ./docker/install
	sh ./workspace/install
	sh ./ag/install
	sh ./ctags/install

install-extra:
	sh ./google-chrome/install
	sh ./postman/install
