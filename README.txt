Gold Noise is the sound of one million pop songs all playing at once.
http://www.sundialtone.com/?p=683

This is a Gold Noise generator for Mac OS X. Build it using Platypus,
http://www.sveinbjorn.org/platypus

You will need to bundle CocoaDialog,
http://cocoadialog.sourceforge.net/

The ruby script uses Mac's built-in mdfind command (e.g. Spotlight for the command line) to find music files and afplay to play the files.



Some useful commands when playing with this code:

ps aux | grep afplay
will list all instances of afplay

killall afplay
will kill all instances of afplay