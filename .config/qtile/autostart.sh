#!/bin/sh
thunderbird &
rclone mount GoogleDrive: google-drive &
feh --bg-fill $HOME/.config/walls/bridge.jpg
