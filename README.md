# config

## General Setup

The `setup.sh` script handles setting up symlinks for the config files.

## Swapping Caps Lock and Escape

1. `sudo nvim /etc/default/keyboard`
2. Change `XKBOPTIONS=""` to `XKBOPTIONS="caps:swapescape"`
3. Reboot
