#!/bin/bash

/bin/sleep 100m
/bin/sleep $[ ( $RANDOM % 3200 ) + 1 ]s
/usr/bin/puppet agent --test --no-daemonize --onetime -v >>/linuxcash/logs/current/puppet.log
/bin/sleep 30m
/bin/sleep $[ ( $RANDOM % 3200 ) + 1 ]s
/usr/bin/puppet agent --test --no-daemonize --onetime -v >>/linuxcash/logs/current/puppet.log
