# papermc-docker
An easy to run docker image for Minecraft based on Paper.

https://papermc.io/

A sample docker compose file can be found on docker hub.

https://hub.docker.com/r/therysin/papermc

This image was created specifically for easy bind mounting, meaning you can edit all server files easily. This is why only two environment variables are used for server.properties parameters. Feel free to bind mount as shown in the sample compose file and edit the server.properties as needed (or other files/add plugins etc.)
