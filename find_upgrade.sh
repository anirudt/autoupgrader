#!/bin/ash

opkg update

opkg list_installed > /tmp/cust_soft

grep -o '^[^ ]*' /tmp/cust_soft | while read sw; do
  echo "Upgrading $sw"
  opkg upgrade $sw
done
