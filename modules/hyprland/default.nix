{ lib, config, inputs, ...}: 
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
    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig = readFile ./hyprland.conf;
    };
  };
}
