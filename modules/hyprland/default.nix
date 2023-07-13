{ lib, config, pkgs, ...}: 
with lib;
let
  cfg = config.modules.hyprland;
in
{
  options.modules.hyprland = { enable = mkEnableOption "hyprland"; };
  config = mkIf cfg.enable {
    modules = {
      alacritty.enable = true;
      waybar.enable = true;
      wofi.enable = true;
      swaylock.enable = true;
      mako.enable = true;
    };
    home.packages = with pkgs; [
      hyprland
    ];
  };
}
