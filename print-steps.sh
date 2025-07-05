#!/bin/bash
set -eux

cat <<EOS

==> Next Steps

cd nixos-preinstall
sh create-partitions.sh
sh format-partitions.sh
sh setup-mountpoints.sh

git clone https://github.com/oeilvert1997/nixos-config.git
nixos-generate-config --root /mnt

vi ./nixos-config/hosts/vm-diva-00/hardware-configuration.nix
vi ./nixos-config/hosts/vm-diva-00/default.nix

cd ./nixos-config
nixos-install --root /mnt --flake .#diva-00 --show-trace --verbose

nixos-enter --root /mnt -c 'passwd oeilvert'
reboot
EOS
