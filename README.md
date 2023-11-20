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

This instructions are from [reddit](https://www.reddit.com/r/awesomewm/comments/xi6ab5/installing_awesomewm/?share_id=9lQP3D9oapIwjMFCDpC1I&utm_content=2&utm_medium=android_app&utm_name=androidcss&utm_source=share&utm_term=1)
I added some packages, but you can access the original post to see the original
packages listed.

1. Install Compiler

```
$ sudo apt install cmake make gcc
```

2. Install Lua

```
$ sudo apt install lua5.4 liblua5.4-dev lua-busted lua-discount lua-ldoc lua-lgi lua5.4
```

3.1. Install Dependencies (recommended)

```
$ sudo apt install asciidoctor debhelper-compat  imagemagick libcairo2-dev \
libdbus-1-dev libgdk-pixbuf2.0-dev libglib2.0-dev libpango1.0-dev \
libstartup-notification0-dev libx11-xcb-dev libxcb-cursor-dev libxcb-icccm4-dev \
libxcb-keysyms1-dev libxcb-randr0-dev libxcb-shape0-dev libxcb-util0-dev \
libxcb-xinerama0-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-xtest0-dev \
libxdg-basedir-dev libxkbcommon-dev libxkbcommon-x11-dev x11proto-core-dev \
xmlto zsh  build-essential dbus-x11 gir1.2-gtk-3.0 libxcb-icccm4-dev \
libxcb-util0-dev libxcb1-dev x11-apps x11-utils x11-xserver-utils xfonts-base \
xterm xvfb libxcb-xfixes0-dev lxappearance xserver-xephyr
```

3.2. Alternatively Install Dependencies with. You need to enable the source repository in order to run this command.

```
$ sudo apt build-dep awesome
```

4.1. Compile Awesome with 'make install'

```
$ git clone https://github.com/awesomeWM/awesome.git
$ cd awesome
$ make
$ sudo make install
```

4.2 Alternatively build with deb package.

```
$ git clone https://github.com/awesomewm/awesome
$ cd awesome
$ make package
$ cd build
$ sudo apt install ./*.deb
```

After the dependencies installation, it's time to follow the AwesomeWM Github
instructions to build the git version

```
$ sudo apt build-dep awesome
$ git clone https://github.com/awesomewm/awesome
$ cd awesome
$ make package
$ cd build
$ sudo apt install ./*.deb
```

After build and instalation it's necessary to define ~/.xinitrc

```
$ echo "exec awesome" >> ~/.xinitrc
```

## OTHER SOFTWARES

### Rofi

Install `rofi` from the the package manager from your distro

```
$ sudo apt install -y rofi
```

After that, copy the themes from github repository
`https://github.com/adi1090x/rofi` following the installation instructions.

```
$ git clone --depth=1 https://github.com/adi1090x/rofi.git
$ cd rofi
$ chmod +x setup.sh
$ ./setup.sh
```

Add this lines into your `~/.bashrc`. These lines are necessary to use the
`Mod4 + r` shortcut from the configuration in my repository.

```
# Edit .bashrc and add this line
export PATH=$HOME/.config/rofi/scripts:$PATH
```

Now you can run `$ startx` from a `tty` to start using AwesomeWM.

## CONFIGURATION

### SSH-AGENT

To use `ssh` properly you need to start the `ssh-agent`. So, add this
instruction into your `~/.bashrc` file.

```
# Start ssh-agent if it's not alreaddy running
[ -n "$SSH_AUTH_SOCK" ] || eval `ssh-agent`
```

The configuration of Awesome is done by creating a
`$XDG_CONFIG_HOME/awesome/rc.lua` file, typically `~/.config/awesome/rc.lua`.
Here we have a minor variation in comparisson with git version of AwesomeWM and
the repository version. The repository version, we can find `rc.lua` in the
folder `/etc/xdg/awesome/rc.lua`.

### Themes and global configuration

But the AwesomeWM `git-version` stores the `rc.lua` file in
`/usr/local/etc/xdg/awesome/rc.lua`. So, we'll copy the `rc.lua` file from
there and add it into `~/.config/awesome/rc.lua`.

```
$ cp /usr/local/etc/xdg/awesome/rc.lua ~/.config/awesome/rc.lua
```

The `themes` folder has a difference too. The repository version stores the
`themes` folder inside `/usr/share/awesome/themes`. While the `git-version` stores
it inside into `/usr/local/share/awesome/themes`. So, like before, we will
copy from `git-version` default directory into `~/.config/awesome/themes`

```
$ cp -r /usr/local/share/awesome/themes /usr/local/share/awesome/themes
```

#### Testing the changes

It's important to have a control version of your changes and test any change
before save your environment. So, we use `Xephyr` to build this test
environment for us.

###### Insalling Xephyr

```
$ unset XDG_SEAT
$ sudo apt install -y xserver-xephyr
```

##### Creating the teste environment

```
$ Xephyr :1 -ac -br -noreset -screen 1200X768 &
```

##### Copy the new configuration into the test environment

```
$ DISPLAY=:1.0 awesome -c ~/.config/awesome/rc.lua
```

If in the Xephyr screen everyhting is ok, so, we can stay with the
configuration or revert to previous one. Because of this is important to have
your conde under git.
