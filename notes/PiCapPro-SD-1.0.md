# PiCapPro SD 1.0

Setup instructions for prototype PiCapPro SD board by [D.Riches](https://github.com/danriches).

![1](2019-05-17/1.jpg)

Connecting the board
--------------------
Pull up gently the top part of the connector on the Raspberry Pi's CSI MIPI 
connector, located close to the Ethernet connector. Insert the ribbon cable 
with the shiny connector pins facing away from the Ethernet connector and 
gently close the top part of the connector, ensure the cable is level and 
secure before powering up.


Driver Installation
-------------------
Open the config.txt file located in the boot partition and add: dtoverlay=adv7282m
You may need to enable the camera option within raspi-config too.

Once you've done this and rebooted, open a command prompt and type "ls /dev". You should 
see "video0" listed.

Set Video Format
----------------
v4l2-ctl -d /dev/video0 -s pal-B    Sets to PAL video input - PAL-B
v4l2-ctl -d /dev/video0 -s pal-I    Sets to PAL video input - PAL-I
v4l2-ctl -d /dev/video0 -s NTSC     Sets to NTSC video input
v4l2-ctl --all              Shows Video4Linux2 video settings

Please see "https://helpmanual.io/help/v4l2-ctl/" for more command options

Download and compile the Yavta tool
-----------------------------------
You'll need the Yavta application from GitHub, so open a command prompt and type:
"git clone https://github.com/6by9/yavta"
Next type "cd yavta" and then "make" to compile the application.
You may need to install more support software to compile, try this if it doesn't compile:
"sudo apt-get install build-essential cmake"

Capture and Image
-----------------
Open a command prompt and change to the yavta tool folder
"cd ~/yavta"
Capture a single frame:
"./yavta --capture=1 -f UYVY -m -T /dev/video0"
You should see a raw image file saved into the same location.


Capture a Video
---------------
As above but change the --capture=1 to use however many frames you desire.


Some useful forum posts
-----------------------
https://www.raspberrypi.org/forums/viewtopic.php?t=221010