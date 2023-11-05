# AwesomeWM

This is my journey to create my personal environment using `Awesome WM`.
I'll describe dependencies, configuration steps and everything necessary to
reproduce it. But this is my hobbie and a personal path through `Lua
programming language` and `Awesome WM`.

I'm using `Debian Bookworm`.

## DEPENDENCIES

Firt of all, we need to install an environment that we can test our
configuration. The Xephyr can help us to create and simulated screen
environment and test our configuations across the changes.

`$ sudo apt install -y xserver-xephyr`

After that, we install Awesome WM

`$ sudo apt install -y awesome`

## CONFIGURATION

The configuration of Awesome is done by creating a
`$XDG_CONFIG_HOME/awesome/rc.lua` file, typically `~/.config/awesome/rc.lua`.
We copy the file from `/etc/xdg/awesome/rc.lua`. After that, wy copy the theme
folder from `/usr/share/awesome/themes` into `~/.config/awesome/themes`

After that, test the environment
`$ unset XDG_SEAT`

`$ Xephyr :1 -ac -br -noreset -screen 1200X768 &`

`$ DISPLAY=:1.0 awesome -c ~/.config/awesome/rc.lua`

If in the Xephyr screen everyhting is ok, so, we can add awesome into our init
configuration.

`$ echo "exec awesome" >> ~/.xinitrc`
