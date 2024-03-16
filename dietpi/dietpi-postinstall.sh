#!/usr/bin/env bash

# ----------------------------------------------------------------------------
#        name : dietpi-postinstall.sh
#      author : "Brian Huddleston" <binarynomad@gmail.com>
# create_date : 2021-07-17 (11:51)
# description : script to perform initial setup of a dietpi that is not able to be automated by the dietpi.txt file.
# ----------------------------------------------------------------------------

# -------------------------------------
# Variables
# -------------------------------------

export IP_SCRIPT="https://raw.githubusercontent.com/binarynomad/common-configs/main/dietpi/ip-notify.sh"

# -------------------------------------
# Functions
# -------------------------------------

add_ip_notification() {
  # Share IP info via a pushover notification using an API at DigitalOcean
  if [[ -d "/etc/network/if-up.d" ]]; then
    cd /etc/network/if-up.d
    curl -L -O $IP_SCRIPT
    chmod 755 ip-notify.sh
  fi
}


# -------------------------------------
# Main Program
# -------------------------------------

# install_ssh_key ${SSH_KEY_URL}
# reset_sshd_hostkeys
add_ip_notification
/etc/network/if-up.d/ip-notify.sh

