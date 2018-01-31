#!/bin/bash -eux
grep -wvFf <(ls /data/domains/) <(ls certs/*/*.csr | grep -vf <(echo -e "node-exporter\ncadvisor") | cut -d"/" -f2) | xargs -i% ls /system/haproxy/certs/%
