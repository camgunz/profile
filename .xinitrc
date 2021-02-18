xrdb -merge ~/.Xresources
# xinput set-float-prop 13 'libinput Accel Speed' 1
xinput set-prop 13 'libinput Accel Speed' 1
xinput set-prop 13 'libinput Accel Profile Enabled 1' 0
xinput set-prop 13 'libinput Tapping Enabled' 1
xinput set-prop 13 'libinput Middle Emulation Enabled' 1

exec startfluxbox
