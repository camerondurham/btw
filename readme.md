# arch desktop setup

This repo is very much based on/inspired by:
https://github.com/octetz/linux-desktop. I chose not to fork since I don't want
`st` or `dwm` setup but very much indebted to
[josh (octetz)](https://octetz.com)'s handy `lof` script and such. If I
write anything meaningful/helpful I'll contribute back.

This is a set of scripts to setup a pretty boring graphical environment on an Arch
Linux installation. It's pretty boring but simple and productive for me.

This is just public so I don't have to configure auth when cloning from github
and will probably overwrite any nvim, tmux or x config you might have.  So this
is a warning not to use this. I only recommend testing this in a fresh install
of Arch with an AMD CPU and NVIDIA GPU (can be in a VM, I tested this that way).

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

## notes

Had removed `obs-linuxbrowser-bin` because it also needed `gconf` and `ceph-minimal` aur packages installed with it.

See [package](https://aur.archlinux.org/packages/obs-linuxbrowser-bin)

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


