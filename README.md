# ansible-playground
Ansible Playground

```shell
ansible all -m ping -u root
ansible all -a "df -h" -u root
ansible all -m apt -a "name=vim state=latest" -u root
ansible server1:server2 -m ping -u root
```


