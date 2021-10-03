.PHONY: install config update list

install:
	echo installing packages...
	cd pkg && sudo ./install-official-packages.sh && ./install-aur-packages.sh

installaur:
	echo installing just aur packages...
	cd pkg && ./install-aur-packages.sh

config:
	cd pkg && sudo ./configure-system.sh && ./configure-user.sh && ./download-wallpapers.sh

config-user:
	cd pkg && ./configure-user.sh

update:
	cd pkg && ./update-config.sh

# oh this is so ugly but ok for now
list:
	echo -e " install\n installaur\n config\n config-user\n update\n"
