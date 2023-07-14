{ lib, config, pkgs, ...}:
with lib;
let
  cfg = config.hostModules.desktop;
in
{
  options.hostModules.desktop = { enable = mkEnableOption "desktop"; };
  config = mkIf cfg.enable {
    hostModules.console.enable = true;
    hostModules.doas.enable = true;
    hostModules.fonts.enable = true;
    hostModules.home.enable = true;
    hostModules.neovim.enable = true;
    hostModules.nixos.enable = true;
    hostModules.packages.enable = true;
    hostModules.persistent.enable = true;
    hostModules.pipewire.enable = true;
    hostModules.systemd-boot.enable = true;
    hostModules.user.enable = true;

    programs.hyprland.enable = true;
    hardware.opengl = {
      enable = true;
      driSupport = true;
    };
  };
}
