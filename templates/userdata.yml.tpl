#cloud-config
write_files:
  - path: /etc/hosts
    content: |
      # IPv4 and IPv6 localhost aliases
      127.0.0.1           localhost
      ::1                 localhost
      127.0.0.1          vip
    permissions: 0644
    owner: root
