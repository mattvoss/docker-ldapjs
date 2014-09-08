docker-ldapjs
=============

Dockerfile that installs the ldap-server node app

Installation
------------

```
git clone https://github.com/mattvoss/docker-ldapjs.git
sudo docker build -t ldapjs-server .
sudo docker run \
  -e "MYSQL_HOST=host ip address" \
  -e "MYSQL_NAME=dbname" \
  -e "MYSQL_USERNAME=username" \
  -e "MYSQL_PASSWORD=password" \
  -e 'LDAP_DN=dc=example,dc=com' \
  -e 'LDAP_OU=ou=people' \
  -e 'LDAP_PORT=389' \
  -e 'LDAP_USER=admin' \
  -e 'LDAP_PASSWORD=password' \
  --name ldap \
  -p 389:389 \
  -d ldapjs-server
```
