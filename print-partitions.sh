#!/bin/bash
set -eux

parted /dev/sda -- unit MiB print
lsblk -o NAME,MAJ:MIN,RM,SIZE,RO,TYPE,FSTYPE,LABEL,MOUNTPOINT
