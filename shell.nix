{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/34f85de51bbc74595e63b22ee089adbb31f7c7a2.tar.gz") {}, compiler ? "ghc884" }:

pkgs.mkShell {
  buildInputs = with pkgs; [ 
    haskell.compiler.ghc884
    (import ./default.nix { inherit pkgs compiler; })
  ];

  shellHook = ''
    __GHCPATH=$(echo $(whereis ghc) | sed 's/^....//')
    echo "ghc_path: $__GHCPATH" > config.yaml 
  '';
}
