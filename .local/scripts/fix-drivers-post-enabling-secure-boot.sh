#!/user/bin/env bash

# info from https://forums.linuxmint.com/viewtopic.php?t=451339
# This should be run right after enabling secure boot and you find that your graphics
# drivers aren't loading

sudo update-secureboot-policy --enroll-key
