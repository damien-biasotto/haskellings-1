{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/5c37ad87222cfc1ec36d6cd1364514a9efc2f7f2.tar.gz") {}, compiler ? "ghc8107" }:
pkgs.pkgs.haskell.packages.${compiler}.callPackage ./haskellings.nix { }
