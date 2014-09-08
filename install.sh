#!/bin/bash
set -e

MYSQL_HOST=${MYSQL_HOST:-172.17.42.1}
MYSQL_USERNAME=${MYSQL_USERNAME:-username}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-password}
MYSQL_DATABASE=${MYSQL_DATABASE:-mail}

LDAP_PORT=${LDAP_PORT:-6379}
LDAP_DN=${LDAP_DN:-dc=example,dc=com}
LDAP_OU=${LDAP_OU:-ou=people}
LDAP_USER=${LDAP_USER:-user}
LDAP_PASSWORD=${LDAP_PASSWORD:-password}

# configure politkz settings.json
sed 's/{{MYSQL_HOST}}/'${MYSQL_HOST}'/' -i /data/ldap-server/config/settings.json
sed 's/{{MYSQL_USERNAME}}/'${MYSQL_USERNAME}'/' -i /data/ldap-server/config/settings.json
sed 's/{{MYSQL_PASSWORD}}/'${MYSQL_PASSWORD}'/' -i /data/ldap-server/config/settings.json
sed 's/{{MYSQL_DATABASE}}/'${MYSQL_DATABASE}'/' -i /data/ldap-server/config/settings.json

sed 's/{{LDAP_PORT}}/'${LDAP_PORT}'/' -i /data/ldap-server/config/settings.json
sed 's/{{LDAP_DN}}/'${LDAP_DN}'/' -i /data/ldap-server/config/settings.json
sed 's/{{LDAP_OU}}/'${LDAP_OU}'/' -i /data/ldap-server/config/settings.json
sed 's/{{LDAP_USER}}/'${LDAP_USER}'/' -i /data/ldap-server/config/settings.json
sed 's/{{LDAP_PASSWORD}}/'${LDAP_PASSWORD}'/' -i /data/ldap-server/config/settings.json

touch /data/installed
