#!/bin/sh
# Copyright © 2021, developerlizhi All Rights Reserved.
# Date:2021-12-31
cat>/etc/hosts<<EOF
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting. Do not change this entry.
##
127.0.0.1 localhost
255.255.255.255 broadcasthost
::1 localhost
# Added by Docker Desktop
# To allow the same kube context to work on the host and the container:
127.0.0.1 kubernetes.docker.internal
# End of section

EOF
curl https://raw.hellogithub.com/hosts >> /etc/hosts && cat /etc/hosts