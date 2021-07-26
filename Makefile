install-pkg:
	echo installing packages...
	cd pkg && sudo ./install-official-packages.sh && ./install-aur-packages.sh

configure:
	cd pkg && ./configure-system.sh && ./configure-user.sh