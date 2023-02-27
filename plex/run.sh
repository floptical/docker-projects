# if container exists, attempt to start
# nothing bad happens if it's already started
if [ -n "$(docker ps -aqf "name=plex")" ]; then
    docker start plex
else
    docker run  -itd \
        --name plex \
        --network host \
        --volume=/plex/media/:/data \
        --volume=/plex/database:/config \
        plexinc/pms-docker
fi
