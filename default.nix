{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/b05d2077ebe219f6a47825767f8bab5c6211d200.tar.gz") {}, compiler ? "ghc902" }:
pkgs.pkgs.haskell.packages.${compiler}.callPackage ./haskellings.nix { }
