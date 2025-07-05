#!/bin/bash
set -eux

parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart ESP fat32 1MiB 513MiB
parted /dev/sda -- mkpart root ext4 513MiB -8GiB
parted /dev/sda -- mkpart swap linux-swap -8GiB 100%
parted /dev/sda -- set 1 esp on

sh ./print-steps.sh
