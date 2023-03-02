#!/bin/bash

if test -f "/server/script.run"; then
    echo "Script already ran. Starting Server."
    sed -i '/online-mode/c\online-mode=$env_online' server.properties
    java -Xmx$env_ram -jar paper.jar
else
    touch /server/script.run
    echo "Initializing"
    cp -a /tempserver/* /server/
    echo "Files copied to /server"
    rm -r /tempserver
    echo "Starting..."
    sed -i '/online-mode/c\online-mode=$env_online' server.properties
    java -Xmx$env_ram -jar paper.jar
fi
