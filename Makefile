install:
	sh ./bash/install
	sh ./php/install
	sh ./composer/install
	sh ./fonts/install
	sh ./git/install
	sh ./nvim/install
	sh ./tmux/install
	sh ./node/install
	sh ./docker/install
	sh ./workspace/install
	sh ./ag/install
	sh ./ctags/install
	sh ./diff-highligth/install
	sh ./lastpass/install

install-extra:
	sh ./google-chrome/install
	sh ./postman/install
	sh ./balsamiq/install
	sh ./spotify/install
