# wayland-mx-thumb-button
This script should map the thumb button of my first generation Logitech MX Master to a keystroke.

Since the thumb button of my MX Master is named with three asterisks, the original script by mathportillo (https://github.com/mathportillo/wayland-mouse-mapper) will not work.

I made this script as a quick fix, based on the original one. It should work with a 1st gen MX Master out of the box, the default action on click will show the gnome overview.

This script is based on reading events from `libinput`, emulating keys using `evemu` and should work on wayland.

A small script for mapping mouse buttons to keystrokes on Wayland.

## Prerequisites
The script depends on the following executables being available in your PATH:
- libinput
- evemu

to install those just run the following command (with root privileges):
```
dnf -y install libinput evemu
```

## Usage
Run the following command (with root privileges):
```
./mousemapper.sh
```

## Installation (start at boot)
Run the following commands (with root privileges):
```
cd /opt/ && git clone https://github.com/lukistellar/wayland-mx-thumb-button
cp wayland-mx-thumb-button/mousemapper.service /usr/lib/systemd/system/
systemctl enable mousemapper.service
```
