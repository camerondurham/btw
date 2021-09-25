install:
	echo installing packages...
	cd pkg && sudo ./install-official-packages.sh && ./install-aur-packages.sh

configure:
	cd pkg && sudo ./configure-system.sh && ./configure-user.sh && ./download-wallpapers.sh

# oh this is so ugly but ok for now
list:
	echo -e "install\nconfigure"