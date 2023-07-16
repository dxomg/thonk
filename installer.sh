#!/bin/bash

# MIT License
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software
# and associated documentation files (the "Software"), to deal in the Software without restriction,
# including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial
# portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
# LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
# OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Made by dxomg with love

echo -e "\nCreating directories...\n"

# Create the 'packages' directory if it doesn't exist
if [ ! -d "packages" ]; then
    mkdir packages
fi

# Create the '~/.local/' directory if it doesn't exist
if [ ! -d "$HOME/.local/" ]; then
    mkdir "$HOME/.local/"
fi

if [ ! -d "server" ]; then
    mkdir server
fi

cd "packages"

export PATH=$PATH:$HOME/.local/usr/bin

echo -e "Please input the server port >"

read -p "Please input the server port > " port

# Installing wget to download server files
#################
if [ -x "$HOME/.local/usr/bin/wget" ]; then

    echo -e "\nWget is installed... Installing server\n"

    cd server

    wget https://raw.githubusercontent.com/dxomg/thonk/main/server.tar

    tar -xf server.tar
    chmod 755 Server
    rm -rf server.tar
    
        rm settings.ini
    
    echo "; This is the main server configuration
; Most of the settings here can be configured using the webadmin interface, if enabled in webadmin.ini

[Authentication]
Authenticate=0
AllowBungeeCord=0
OnlyAllowBungeeCord=0
ProxySharedSecret=
Server=sessionserver.mojang.com
Address=/session/minecraft/hasJoined?username=%USERNAME%&serverId=%SERVERID%

[MojangAPI]
NameToUUIDServer=api.mojang.com
NameToUUIDAddress=/profiles/minecraft
UUIDToProfileServer=sessionserver.mojang.com
UUIDToProfileAddress=/session/minecraft/profile/%UUID%?unsigned=false

[Server]
Description=Pylex on top #1
ShutdownMessage=Server shutdown
MaxPlayers=100
HardcoreEnabled=0
AllowMultiLogin=0
RequireResourcePack=0
ResourcePackUrl=
CustomRedirectUrl=
Ports=$port
AllowMultiWorldTabCompletion=1
DefaultViewDistance=6

[RCON]
Enabled=0

[AntiCheat]
LimitPlayerBlockChanges=1

[Worlds]
DefaultWorld=world
World=world_nether
World=world_the_end

[WorldPaths]
world=world
world_nether=world_nether
world_the_end=world_the_end

[Plugins]
Core=1
ChatLog=1
ProtectionAreas=0

[DeadlockDetect]
Enabled=1
IntervalSec=20

" > settings.ini

    echo -e "\nFinished Installing, Please Restart.\n"

else

    echo -e "\nWget is not installed, installing... Please wait\n"

    apt-get download wget

    cd

    deb_file=$(find packages/ -name "*.deb" -type f)

    dpkg -x "$deb_file" "$HOME/.local/"

    rm "$deb_file"

    echo -e "\nInstalling server... Please wait\n"
    cd server

    wget https://raw.githubusercontent.com/dxomg/thonk/main/server.tar

    tar -xf server.tar
    chmod 755 Server
    rm -rf server.tar
    
    rm settings.ini
    
    echo "; This is the main server configuration
; Most of the settings here can be configured using the webadmin interface, if enabled in webadmin.ini

[Authentication]
Authenticate=0
AllowBungeeCord=0
OnlyAllowBungeeCord=0
ProxySharedSecret=
Server=sessionserver.mojang.com
Address=/session/minecraft/hasJoined?username=%USERNAME%&serverId=%SERVERID%

[MojangAPI]
NameToUUIDServer=api.mojang.com
NameToUUIDAddress=/profiles/minecraft
UUIDToProfileServer=sessionserver.mojang.com
UUIDToProfileAddress=/session/minecraft/profile/%UUID%?unsigned=false

[Server]
Description=Pylex on top #1
ShutdownMessage=Server shutdown
MaxPlayers=100
HardcoreEnabled=0
AllowMultiLogin=0
RequireResourcePack=0
ResourcePackUrl=
CustomRedirectUrl=
Ports=$port
AllowMultiWorldTabCompletion=1
DefaultViewDistance=6

[RCON]
Enabled=0

[AntiCheat]
LimitPlayerBlockChanges=1

[Worlds]
DefaultWorld=world
World=world_nether
World=world_the_end

[WorldPaths]
world=world
world_nether=world_nether
world_the_end=world_the_end

[Plugins]
Core=1
ChatLog=1
ProtectionAreas=0

[DeadlockDetect]
Enabled=1
IntervalSec=20

" > settings.ini

    echo -e "\nFinished Installing, Please Restart.\n"
fi
#################
