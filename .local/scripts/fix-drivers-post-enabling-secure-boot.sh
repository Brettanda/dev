#!/user/bin/env bash

# info from https://forums.linuxmint.com/viewtopic.php?t=451339
# This should be run right after enabling secure boot and you find that your graphics
# drivers aren't loading

DISTRO="$(lsb_release -i | cut -f 2-)"

if [ $DISTRO == "Linuxmint"]; then
  sudo update-secureboot-policy --enroll-key
else
  echo "Found this for linux mint use so it must only work on that distro :) maybe" 
fi
