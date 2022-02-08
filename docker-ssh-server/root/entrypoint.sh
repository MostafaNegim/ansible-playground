#!/bin/bash

echo "Running entrypoint.sh"

# find /etc/cont-init.d/ -maxdepth 1 -type f -executable -name 's*' -exec {} \;
# find /etc/cont-init.d/  -type f  -exec bash {} \;
./etc/cont-init.d/10-adduser
./etc/cont-init.d/50-config
echo "UserName: "
echo ${USER_NAME}
/usr/sbin/sshd -D -e -p 2222 -d
# runuser -u "${USER_NAME}" -- /usr/sbin/sshd -D -e -p 2222
 