# Bloodmoon Kitty

Bloodmoon is the Kitty terminal theme currently used on this machine. It is a
dark red, neo-brutalist / pixel-tech theme with a near-black background, warm
off-white text, hard red borders, and a red-forward ANSI palette.

## Files

- `bloodmoon.conf` - the Kitty theme and window/tab styling.
- `kitty.conf` - the local Kitty config that loads `bloodmoon.conf` and sets the
  font, cursor, remote control socket, and layouts.
- `remote-colors.sh` - optional shell color aliases and environment settings for
  remote hosts.

## Install

Copy the files into your Kitty config directory:

```sh
cp bloodmoon.conf kitty.conf ~/.config/kitty/
```

Then reload Kitty or restart the terminal.

To use the remote shell color helpers, source `remote-colors.sh` from the remote
host shell startup file, for example:

```sh
. ~/.config/kitty/remote-colors.sh
```
