# My dotfiles for maintaining my configuration

## Required programs
- `nix` : package manager
- `home-manager`: config manager
- `yadm`: dotfiles manager

# Steps

Starting from a clean system.

1. Install nix
```bsah 
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

2. Clone repo
```bash
nix run nixpkgs#yadm -- clone git@github.com:tmayoff/.dotfiles.git
```

3. Bootstrap
```bash
nix run nixpkgs#yadm -- decrypt
nix run nixpkgs#home-manager -- switch
```

# Docs

## SDDM
### Refresh Rate
https://www.reddit.com/r/kde/comments/xdfe7y/comment/iocnw9t/?utm_source=share&utm_medium=web2x&context=3
```
Yes, and it's not too hard. There's no GUI for this, but SDDM has a script that's ran on startup, so you can add an xrandr command to it. This script is at /usr/share/sddm/scripts/Xsetup.

Run xrandr to see what output(s) you're using.

Then you simply add something like xrandr --output DP-0 --rate 144 to that file, adjusting DP-0 for whatever output it is. The exact names vary between different vendors, so just go by what xrandr tells you it sees.

Resolution should be automatic, but if not, that's as simple as adding --mode 2560x1440 with your appropriate resolution.

If you also have multiple monitors, you should configure that as well because that also causes monitors to blank out as they load. This can be done using --left-of HDMI-1 or --right-of HDMI-1.

If you do have multiple monitors that all need special settings, you can simply add something like --output DVI-D-2, adjusted for the correct output, and follow that with the above commands that are needed.

You can test all of this in a terminal inside your normal desktop session until you get it how you want it, then paste that command into Xsetup.
```
