#!/bin/sh
set -o errexit -o nounset

function install_from_nix() {
  package_name="$1"
  rel_src="$2"
  dest="$3"

  echo >&2 "Installing [package $package_name]/$rel_src to $dest..."
  root="/nix/var/nix/gcroots/nix-circle/$dest"
  package="$(nix-build --no-build-output --no-out-link --add-root "$root" --show-trace --timeout 300 --attr "$package_name" '<nixpkgs>')"
  src="$package/$rel_src"
  if [ -e "$dest" ]; then
    echo >&2 "Note: backing up old $dest to $dest.old"
    mv -f "$dest" "$dest.old"
  fi
  mkdir -p "$(dirname "$dest")"
  ln -v -s "$src" "$dest"
}

install_from_nix openssh bin/ssh /usr/bin/ssh
install_from_nix git bin/git /usr/bin/git
install_from_nix cacert etc/ssl/certs /etc/ssl/certs

nix-collect-garbage
