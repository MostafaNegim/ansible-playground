ansible app -b -m apt -a "name=python3-pip state=present" -u root
ansible app -b -m pip -a "name=django<4 state=present" -u root
ansible app -a "python3 -m django --version"

ansible db -b -m apt -a "name=mariadb-server state=present" -uroot
ansible db -b -m service -a "name=mariadb state=started enabled=yes" -uroot
ansible db -b -m apt -a "name=python3-pymysql state=present" -uroot

ansible db -b -m mysql_user -a "name=django host=% password=12345 \
priv=*.*:ALL state=present login_unix_socket=/var/run/mysqld/mysqld.sock" -uroot

# Admin
ansible app -b -m group -a "name=admin state=present" -uroot
ansible app -b -m user -a "name=mostafa group=admin createhome=yes" -uroot
ansible app -b -m user -a "name=mostafa state=absent remove=yes" -uroot
#  package
ansible app -b -m package -a "name=git state=present" -uroot

# File
ansible multi -m stat -a "path=/etc/environment" -uroot
# Copy
ansible multi -m copy -a "src=/etc/hosts dest=/tmp/hosts" -uroot
# Retrieve a file from the server
ansible multi -m fetch -a "src=/etc/hosts dest=/tmp" -uroot
# Create directories
ansible multi -m file -a "dest=/tmp/test mode=644 state=directory" -uroot
ansible multi -m file -a "src=/src/file dest=/dest/symlink state=link" -uroot
# Delete
ansible multi -m file -a "dest=/tmp/test state=absent" -uroot
# Log
ansible multi -b -a "tail /var/log/messages" -uroot
