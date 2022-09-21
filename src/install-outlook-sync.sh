#!/usr/bin/env sh
CUR_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# prompt the user for the location of the sounds files
echo "Starting setup for outlook-sounds-sync"

read -p "Sounds Path [$HOME/.outlook-sounds]:" DEFAULT_PATH

if [ -z "$DEFAULT_PATH" ]
then
	DEFAULT_PATH="$HOME/.outlook-sounds"
	echo "Using default sounds path: $DEFAULT_PATH"
fi

# make the sounds directory and mv the soundsync script
mkdir -p "$DEFAULT_PATH"
cp "$CUR_DIR/soundsync.sh" "$DEFAULT_PATH"
SCRIPT_PATH="$DEFAULT_PATH/soundsync.sh"

# update the plist file with the user information
sed -i.bak "s@{SOUNDS_PATH}@$SCRIPT_PATH@" "$CUR_DIR/com.outlook.sounds.sync.plist"

# move plist file to /Library/LaunchDaemons as root
echo "You will be asked for your password here to move the launchd script to a root owned path"
sudo mv "$CUR_DIR/com.outlook.sounds.sync.plist" "/Library/LaunchDaemons"

# load the new plist
sudo launchctl load "/Library/LaunchDaemons/com.outlook.sounds.sync.plist"

# complete
echo """
Outlook Sound Sync setup complete...

Add your .wav files here: $DEFAULT_PATH
"""
