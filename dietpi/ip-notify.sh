#!/usr/bin/bash

# Simple Script to publish the IP addresses of a host after it boots and gets active network.
# Place file in /etc/network/if-up.d/

HOSTNAME=$(/usr/bin/hostname)
PRIVATE_IP=$(/usr/bin/hostname -I)
PUBLIC_IP=$(/usr/bin/curl -s ifconfig.me)
NOTIFY_URL="http://oitd.link/notify"
MESSAGE="$HOSTNAME / $PRIVATE_IP / $PUBLIC_IP"

/usr/bin/curl -L --get --data-urlencode "message=$MESSAGE" $NOTIFY_URL

