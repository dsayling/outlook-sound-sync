![GitHub Release Date](https://img.shields.io/github/release-date/dsayling/outlook-sound-sync)
[![LinkedIn][linkedin-shield]][linkedin-url]

[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black?logo=linkedin&color=blue
[linkedin-url]: https://www.linkedin.com/in/drew-ayling

# Outlook Sound Sync

Outlook Sound Sync is essentially a launchd script that will continually sync the sounds you want to play in Outlook.

And if it's not obvious, this is for macOS only.

## Background

Outlook for MacOs has a really annoying "feature" where you cant actually update the sounds that come from the application.

Luckily, they are just wav files that outlook loads and plays for each event.

Unfortunately, Microsoft's Auto Update Tool can overwrite those files at any point. So updating them manually isn't really an option. Unless you like copying files around manually.

Originally I wrote a script to move the files back when I heard them again, but eventually gave up trying to run it every time I needed to.

So, I built this.

## Install

1. Run this in your Terminal

    ```
    curl -sSL https://raw.githubusercontent.com/dsayling/outlook-sound-sync/main/remote-install.sh | sh
    ```

    As the install runs, it will extract the latest release from this repo and run [src/install-outlook-sync.sh]()

    You will be asked for your password as elevated privileges are required to move the plist file to `/Library/LaunchDaemons` and to create the launchd process.

1. Note the configuration directory

    After the installation and setup is complete, you will see the configuration directory `Add your .wav files here: some/path/here`.

    The default is `$HOME/.outlook-sounds/`, but whatever the directory, it should already be created for you.

1. Configure (see next section)

### Configure

Now that your launchd script is setup, and you know where to put you wav files. Lets configure the sounds.

You can add any of the following files to the directory from the setup:
* `newmail.wav`
    * New email received
* `mailsent.wav`
    * Some email is sent
* `nomail.wav`
    * No new email when syncing a mailbox
* `welcome.wav`
    * Outlook startup sound
* `mailerror.wav`
    * When there's an error syncing a mailbox
* `reminder.wav`
    * Calendar and task reminders

Maybe some [Warcraft 2](http://www.thanatosrealms.com/war2/horde-sounds) sounds? Or something from the [BigSoundBank](https://bigsoundbank.com/)?

You don't have to update them all, whatever sounds you want to override, just place the ones you want to change in the configuration directory.

To quickly get setup with the new sounds, restart your computer.

That's it, your done.

## FAQ

* Why use a system level launchd?
  * Simply because the installation of Office is usually, if not always done as root. So the wav files are also owned by root. Thus, we need to run the sync script as root.

## Roadmap

- [ ] Add formula to [dsayling/homebrew-tap]()
- [ ] Support adding wav files during install process
- [ ] Make 1 million USD
- [ ] Improve README instructions

## Contributions

Feel free to open a PR and tell me what's wrong.

## Bugs

Feel free to open a issue to tell me what's wrong. Although, a PR would be appreciated.
