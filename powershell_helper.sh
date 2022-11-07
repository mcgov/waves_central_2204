#! /usr/bin/bash

#NOTE: This script is hand wavy as hell, but simpler than other solutions I've seen.

# waves central needs powershell, wine's default setup needs some help to get it going
# get yourself to the point where yabridge is installed and setup and you've installed an easy plugin like
# serum or something

#NOTE: You must have already installed wine according to the setup steps at https://github.com/robbert-vdh/yabridge
# once you're there, this other stuff will get Waves Central working to install your plugins.
# install winbind so auth libs will work
sudo apt-get install winbind

# plugins and central need corefonts and gdiplus (maybe some other stuff idk)
winetricks --unattended corefonts gdiplus

# get powershell release (7 might work too, grabbing a 6 release arbitrarily)
wget https://github.com/PowerShell/PowerShell/releases/download/v6.2.4/PowerShell-6.2.4-win-x64.msi

# install powershell with the default options, make sure the 'add to path' option is selected
wine ./PowerShell-6.2.4-win-x64.msi

# (waves uses 'where powershell', so powershell.exe needs to be in path
# the powershell exe we just installed is called pwsh.exe
# so: make a copy that's called powershell.exe, a hardlink might work too idk
cp ~/.wine/drive_c/Program\ Files/PowerShell/6/pwsh.exe ~/.wine/drive_c/Program\ Files/PowerShell/6/powershell.exe
# backup if that doesn't work for you, just copy that bad boy over. oh probably use a wineprefix just for this btw
cp -r ~/.wine/drive_c/Program\ Files/PowerShell/6/* ~/.wine/drive_c/windows/system32/WindowsPowerShell/v1.0/
cp -r ~/.wine/drive_c/Program\ Files/PowerShell/6/* ~/.wine/drive_c/windows/syswow64/WindowsPowerShell/v1.0/

# tada!
# now you should be able to install Waves Central v12 and above like so:
# wine ./Install_Waves_Central.exe

# make sure to set Waves Central ( "~/.wine/drive_c/Program Files/Waves Central/Waves Central.exe" )
# to run on Windows 10. XP isn't supported because ~~we're in the future~~
