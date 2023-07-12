{ config, pkgs, nixpkgs, ...}: {
  imports = [
    ./neovim
    ./git.nix
  ];
}
