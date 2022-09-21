#!/usr/bin/env sh

# prompt the user for the location of the sounds files
echo "Starting setup for outlook-sounds-sync"

# read -p "Sounds Path [$HOME/.outlook-sounds]:" DEFAULT_PATH

# if [ -z "$DEFAULT_PATH" ]
# then
echo "Using default sounds path"
DEFAULT_PATH="$HOME/.outlook-sounds"
# fi
# make the directory and mv the soundsync script
CUR_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir -p "$DEFAULT_PATH"
cp "$CUR_DIR/soundsync.sh" "$DEFAULT_PATH"
SCRIPT_PATH="$DEFAULT_PATH/soundsync.sh"

# update the plist file with the user information
sed -i.bak "s@{SOUNDS_PATH}@$SCRIPT_PATH@" com.outlook.sounds.sync.plist

# move plist file to /Library/LaunchDaemons as root
sudo mv com.outlook.sounds.sync.plist /Library/LaunchDaemons

# load the new plist
sudo launchctl load /Library/LaunchDaemons/com.outlook.sounds.sync.plist
