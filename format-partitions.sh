#!/bin/bash
set -eux

mkfs.fat -F 32 -n boot /dev/sda1
mkfs.ext4 -L nixos /dev/sda2
mkswap -L swap /dev/sda3
swapon /dev/sda3

sh ./print-steps.sh
