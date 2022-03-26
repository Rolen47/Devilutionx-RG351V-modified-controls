#!/bin/bash

if [ -d "/opt/system/Tools/PortMaster/" ]; then
  controlfolder="/opt/system/Tools/PortMaster"
elif [ -d "/opt/tools/PortMaster/" ]; then
  controlfolder="/opt/tools/PortMaster"
else
  controlfolder="/roms/ports/PortMaster"
fi

source $controlfolder/control.txt

get_controls

cd /$directory/ports/devilution

#Fix A/B/X/Y buttons. Swap Left and Right analog stick:
sdl_controllerconfig="03000000091200000031000011010000,OpenSimHardware OSH PB Controller,a:b1,b:b0,x:b3,y:b2,leftshoulder:b4,rightshoulder:b5,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,leftx:a2,lefty:a3,guide:b12,leftstick:b8,lefttrigger:b10,rightstick:b9,back:b7,start:b6,rightx:a0~,righty:a1~,righttrigger:b11,platform:Linux,"

export SDL_GAMECONTROLLERCONFIG="$sdl_controllerconfig"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib32"
cd /$directory/ports/devilution
./devilutionx --config-dir /$directory/ports/devilution --data-dir /$directory/ports/devilution --save-dir /$directory/ports/devilution
unset SDL_GAMECONTROLLERCONFIG
printf "\033c" >> /dev/tty1
