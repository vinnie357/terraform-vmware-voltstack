#cloud-config
users:
  - default
  - name: ${USER}
    lock_passwd: false
    groups: sudo, users, docker, wheel
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh_authorized_keys:
      - ${PUBKEY}
chpasswd:
  list: |
     root:${PASSWORD}
     ${USER}:${PASSWORD}
  expire: False
user: root
password: ${PASSWORD}
chpasswd: {expire: False}
write_files:
  - path: /etc/hosts
    content: |
      # IPv4 and IPv6 localhost aliases
      127.0.0.1           localhost
      ::1                 localhost
      127.0.0.1          vip
    permissions: 0644
    owner: root
bootcmd:
 - echo WELCOME TO THE JUNGLE >> /etc/motd
