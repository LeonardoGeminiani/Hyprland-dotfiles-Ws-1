#!/bin/bash

DIR="/tmp"
DEST="$DIR/discord.tar.gz";

# Use wget to download the file
wget -O "$DEST" "https://discord.com/api/download/stable?platform=linux&format=tar.gz"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "File downloaded successfully to $DEST";

    cd "$DIR";
    tar -xzf "$DEST";
    cd "./Discord";
    rm "./discord.desktop"

    sudo cp -rf  ./* /opt/discord/
else
    echo "Failed to download the file"
    exit 1
fi