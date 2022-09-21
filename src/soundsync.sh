#!/usr/bin/env sh

outlookPath="/Applications/Microsoft Outlook.app/Contents/Frameworks/OutlookCore.framework/Versions/Current/Resources"
# we assume that this script is located with the sound files
default_soundPath=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

allSounds=("goodbye.wav" "mailsent.wav" "nomail.wav" "welcome.wav" "mailerror.wav" "newmail.wav" "reminder.wav")

for sound in ${allSounds[@]}; do
    # check the file exists
    echo "Checking for $default_soundPath/$sound"
    if [ -f "$default_soundPath/$sound" ]; then
        echo "Found $sound"
        if [ `cmp -s "$default_soundPath/$sound" "$outlookPath/$sound"` ]; then
            sudo cp "$default_soundPath/$sound" "$outlookPath/$sound"
            echo "Copied $sound"
        else
            echo "$sound File are still the same"
        fi
    else
        echo "didnt find $sound"
    fi
    continue
done
