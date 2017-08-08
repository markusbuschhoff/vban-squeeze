# vban-squeeze, play VBAN streams on your Squeeze devices
&copy;2017 Markus Buschhoff, based on WaveIn &copy; Bryan Alton and others

This plugin for Logitech Media Center (Linux) allows to play VBAN streams (see http.//vb-audio.com) 
to your Squeeze devices. By that, you can have live streams of your Windows audio devices.

## Installation:

1. Install the free "VoiceMeeter Banana" (http://www.vb-audio.com/Voicemeeter/banana.htm) on your windows machine.
2. Donwload and compile the Linux vban_receptor (https://github.com/quiniouben/vban) on the machine where Logitech Media Center is running. 
3. Make sure, the vban_receptor and vban_url_receptor executables are in the PATH (e.g. copy them to /usr/local/bin )
4. Open your Media Server URL, go to Settings/Plugins and down on the bottom of the page, add the 
   repository: http://raw.githubusercontent.com/markusbuschhoff/vban-squeeze/master/vban.xml 
5. Activate the VBAN plugin in the Plugin list
6. Restart the Media Server

## Usage:

### VoiceMeeter preparation (Skip if you are already familiar with VoiceMeeter)

- Under Windows, configure the VoiceMeeter Banana Audio Interface as your standard audio device, so that all sound will be routed 
  through it (Windows Control Panel / Sound and Audio Devices)
- Start VoiceMeeter, active A1 on both virtual inputs. In the A1 dropdown (top right of the mixer panel),
  choose an actual audio output to listen to.
- You should hear sounds played on your PC on this device and should be able to control the volume with one virtual input slider 
  and the left "master" slider

### Activating VBAN on Windows

- In the VoiceMeeter mixer, click on the VBAN symbol (top right)
- Under "Outgoing Streams" select the bus you want to stream
- Add the IP address of your Logitech media server
- Set SampleRate to 44100 (leave 2 Channels, PCM 16 bits, optimal quality)
- Activate the stream (On-Button left of it) and activate VBAN (top left button)

Hint: Your Windows IP-Address will be shown in the top area of the window. Note it, as you will need it.

### Playing the stream on your media server

- Open your Media Server, under Radio / Play from URL enter the URL  vban://ip-address/Stream1 with ip-address being the noted
  IP of the Windows machine sending the stream. You can also add the port, if you altered the standard port, or choose another
  stream name. The stream name identifies the stream and must be exactly the same as in VoiceMeeter.
