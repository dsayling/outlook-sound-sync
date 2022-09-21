# Outlook Sound Sync

Outlook Sound Sync is essentially a launchd script that will continually sync the sounds you want to play in outlook.

## Background

Outlook for mac has a really annoying "feature" where you cant actually update the sounds that come from the application.

Luckily, they are just wav files that outlook loads and plays for each event.

Unfortunately, Microsoft's Auto Update Tool will overwrite those files at any time.

So, I built this.

## Install

Simply run,

```
curl -sSL https://raw.githubusercontent.com/dsayling/outlook-sound-sync/main/remote-install.sh | sh
```

As the install runs, it will extract the latest release from this repo and run [src/install-outlook-sync.sh]()

You will be asked for your password as elevated privileges are required to move the plist file to `/Library/LaunchDaemons` and to create the launchd process.

## FAQ

* Why use a system level launchd?
  * Simply because the installation of Office is usually, if not always done as root. So the wav files are also owned by root. Thus, we need to run the sync script as root.
