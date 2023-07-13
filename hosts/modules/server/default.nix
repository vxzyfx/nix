{ lib, config, pkgs, ...}:
with lib;
let
  cfg = config.hostModules.server;
in
{
  options.hostModules.server = { enable = mkEnableOption "server"; };
  config = mkIf cfg.enable {
    hostModules.console.enable = true;
    hostModules.doas.enable = true;
    hostModules.home.enable = true;
    hostModules.neovim.enable = true;
    hostModules.nixos.enable = true;
    hostModules.openssh.enable = true;
    hostModules.packages.enable = true;
    hostModules.persistent.enable = true;
    hostModules.systemd-boot.enable = true;
    hostModules.user.enable = true;
  };
}
