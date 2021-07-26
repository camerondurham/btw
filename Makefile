install-pkg:
	echo installing packages...
	./pkg/install-pacman-official.sh

configure:
	cd pkg && ./configure-user.sh