# arch desktop setup

> guaranteed far too ugly and vanilla to ever be posted on r/unixporn

This repo is very much based on/inspired by:
https://github.com/octetz/linux-desktop. I chose not to fork since I don't want
`st` or `dwm` setup but very much indebted to
[josh (octetz)](https://octetz.com)'s handy `lof` script and such. If I
write anything meaningful/helpful I'll contribute back.

This is a set of scripts to setup a pretty boring graphical environment on an Arch
Linux installation. It's pretty boring but simple and reproducible in case I break
my install.

## setup

On a fresh install of Arch in VirtualBox or a PC with AMD CPU, nvidia GPU,
all you *should* have to do is run the following commands and enter your sudo
password when prompted:

```
# install packages
make install

# setup desktop and dotfiles
make config
```

Make sure the pacstrap command inclues the packages `base-devel` and `git`.

---

**Makefile Details**

```bash
# install required packages from official respositories and aur
make install

# install dotfiles and basic system config (nvim, tmux, aliases, xorg, xfce4)
make config

# print a crudely formatted list of targets
make list
```

## gaming

The script `pkg/steam-install.sh` should help getting steam setup. It's not
automated but mainly a sequence of steps to get Steam, required fonts, and
graphics drivers **for NVIDIA only** installed.

Games I've successfully played on this Arch install:

- Control Ultimate Edition

Games I'm planning to play but haven't made time yet:

- Hades
- Terraria
- Halo Master Chief Collection
- Splitgate
- Portal

## learnings

### multiple monitors

- https://wiki.archlinux.org/title/Xorg#Multiple_monitors
- https://wiki.archlinux.org/title/NVIDIA#Multiple_monitors
- https://wiki.archlinux.org/title/Xfce#Multiple_monitors

Don't try too hard when setting up monitors and make xorg do most of the work. I was using the wrong xrandr command to setup output when I should have left as is.

NVIDIA and xrandr were detecting monitors correctly but DP wasn't getting signal.

Removing my try-hard `/etc/X11/xorg.conf`, deleting xfce4's display config at `~/.config/xfce4/xfconf/xfce-perchannel-xml/displays.xml` and resetting `.xinitrc` to this worked:

```
# xrandr --output "HDMI-0" --mode "$MODE" --output "DP-0" --mode "$MODE" &
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
```

## notes

- `obs-linuxbrowser-bin` also must be installed with dependencies from aur `gconf` and `ceph-minimal` (see [package](https://aur.archlinux.org/packages/obs-linuxbrowser-bin))
- cannot build the aur version of docker, `docker-git`, due to broken/unmaintained package and/or docker project being move to moby/moby repo

