# config

## Symlinks

In order to directly use the files from this repo as config, you must symlink them to the files they replace.

Run the `ln -s <FILE_IN_THIS_REPO> <FILE_BEING_REPLACED>` command to symlink files in this repo to the ones they replace.

## Swapping Caps Lock and Escape

1. `sudo nvim /etc/default/keyboard`
2. Change `XKBOPTIONS=""` to `XKBOPTIONS="caps:swapescape"`
3. Reboot
