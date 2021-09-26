# setup

Very based on/inspired by: https://github.com/octetz/linux-desktop. I chose not to fork since I don't want `st` or `dwm` setup
but very much indebted to [joshrusso](https://twitter.com/joshrosso)'s handy `lof` script and such. If I write anything
meaningful/helpful I'll contribute back.

This is a set of scripts to setup a bare bones graphical environment on an Arch Linux installation.

This is just public so I don't have to configure auth when cloning from github
and **might** break your system if you have anything installed already, or
set anything up in your `~/.config` directory. So this is a warning not to use
this.

## notes

Removing `obs-linuxbrowser-bin` because pkg build is broken. Needs to update dep `gconf` (obsolete apparently).

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


