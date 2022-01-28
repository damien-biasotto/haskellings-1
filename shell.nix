{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/b05d2077ebe219f6a47825767f8bab5c6211d200.tar.gz") {}, compiler ? "ghc902" }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    haskell.compiler.ghc902
    stack
    which
    (import ./default.nix { inherit pkgs compiler; })
  ];

  shellHook = ''
    __GHCPATH=$(echo $(which ghc))
    echo "ghc_path: $__GHCPATH" > config.yaml
  '';
}
