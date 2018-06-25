# Flock Chat, change notification sound

![alt text](https://image4.owler.com/logo/flock_owler_20170318_060528_original.png "flock logo")

This script is only educational, having no intention of harming the company that owns the rights on the application. Made just for fun

## Other Reasons
The notification sound of this application was super irritating, it looked like those TVI programs, I was getting sick of it.

I created this script so that anyone can change the notification sound.

# Requirements

 - [Nodejs](https://nodejs.org/en/download/)
-  [Npm asar utility](https://www.npmjs.com/package/asar)


## How to install asar

> npm install -g asar

After this utilities installed let's do the magic

in terminal execute

> ./flock_patch.sh ~/Downloads/music.wav

the music should be in .wav format if not the flock program can't be work correctly

**Extra:**
if script not run just execute:

> chmod +x ./flock_patch.sh
