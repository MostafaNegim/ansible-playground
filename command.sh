#!/bin/bash
# i=$1
#   docker run -d \
#     --name=server-${i}\
#     --hostname=server-${i} `#optional` \
#     -e PUID=1000 \
#     -e PGID=1000 \
#     -e PUBLIC_KEY='ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEvdIHGLPG8tJPRPqcm6uls+XzbuCYkwYnCFFswso+cO mostafa@ubuntu-asus' \
#     -e SUDO_ACCESS=true \
#     -e PASSWORD_ACCESS=true `#optional` \
#     -e USER_PASSWORD=1 `#optional` \
#     -e USER_NAME=mostafa `#optional` \
#     -p 222${i}:2222 \
#     --ip 172.17.0.$((i+1))\
#     --restart unless-stopped \
#     ssh-server:22.04

for i in {1..4}
do

  docker run -d \
    --name=server-${i}\
    --hostname=server-${i} `#optional` \
    -e PUID=1000 \
    -e PGID=1000 \
    -e PUBLIC_KEY='ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEvdIHGLPG8tJPRPqcm6uls+XzbuCYkwYnCFFswso+cO mostafa@ubuntu-asus' \
    -e SUDO_ACCESS=true \
    -e PASSWORD_ACCESS=true `#optional` \
    -e USER_PASSWORD=1 `#optional` \
    -e USER_NAME=mostafa `#optional` \
    -p 222${i}:2222 \
    --ip 172.17.0.$((i+1))\
    --restart unless-stopped \
    ssh-server
  done
  # -e PUBLIC_KEY_FILE="~/.ssh/id_ed25519.pub" `#optional` \

