install:
	echo installing packages...
	cd pkg && sudo ./install-official-packages.sh && ./install-aur-packages.sh

configure:
	cd pkg && sudo ./configure-system.sh && ./configure-user.sh && ./download-wallpapers.sh

# shamefully copied from https://stackoverflow.com/a/15058900/4676641
.PHONY: no_targets__ list
no_targets__:
list:
    sh -c "$(MAKE) -p no_targets__ | awk -F':' '/^[a-zA-Z0-9][^\$$#\/\\t=]*:([^=]|$$)/ {split(\$$1,A,/ /);for(i in A)print A[i]}' | grep -v '__\$$' | sort"