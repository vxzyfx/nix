{ config, pkgs, nixpkgs, hyprland, ...}: {
  imports = [
    ./gui
    ./dev
  ];
  home = {
    username = "shug";
    homeDirectory = "/home/shug";
    stateVersion = "23.05";
  };
  
  programs.home-manager.enable = true;
}
