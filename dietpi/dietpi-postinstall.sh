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

export SSH_KEY_URL="https://github.com/binarynomad.keys"

# -------------------------------------
# Functions
# -------------------------------------

install_ssh_key() {
  # Installs an known ssh_key from a url, generally from github
  mkdir $HOME/.ssh
  chmod 750 $HOME/.ssh
  curl $1 >> $HOME/.ssh/authorized_keys
  chmod 600 $HOME/.ssh/authorized_keys
}

reset_sshd_hostkeys() {
  # For security reasons, you want to reset the hosts SSH keys
  if [[ -d "/etc/dropbear" ]]; then
    rm /etc/dropbear/*host_key
    /usr/bin/dropbearkey -t dss -f /etc/dropbear/dropbear_dss_host_key
    /usr/bin/dropbearkey -t rsa -f /etc/dropbear/dropbear_rsa_host_key
    /usr/bin/dropbearkey -t ecdsa -f /etc/dropbear/dropbear_ecdsa_host_key
    echo 'DROPBEAR_EXTRA_ARGS="-s -g"' >> /etc/default/dropbear
  fi
}

# -------------------------------------
# Main Program
# -------------------------------------

install_ssh_key ${SSH_KEY_URL}
reset_sshd_hostkeys


