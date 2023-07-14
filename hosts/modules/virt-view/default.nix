{ lib, config, pkgs, user, ...}:
with lib;
let
  cfg = config.hostModules.virt-view;
in
{
  options.hostModules.virt-view = { enable = mkEnableOption "virt-view"; };
  config = mkIf cfg.enable {
    hostModules.libvirt.enable = true;
    environment.systemPackages = with pkgs; [ virt-viewer ];
  };
}
