{ config, pkgs, nixpkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./foot.nix
    ./hyprland.nix
    ./icons.nix
    ./mako.nix
    ./swaylock.nix
    ./tmux.nix
    ./waybar.nix
    ./wofi.nix
  ];
  
  home = {
    packages = with pkgs; [
      google-chrome
      firefox
      virt-manager
      zeal-qt6
      jetbrains.webstorm
      jetbrains.ruby-mine
      jetbrains.rider
      jetbrains.pycharm-professional
      jetbrains.idea-ultimate
      jetbrains.goland
      jetbrains.dataspell
      jetbrains.clion
    ];
  };
}
