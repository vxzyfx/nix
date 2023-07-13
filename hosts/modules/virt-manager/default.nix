{ lib, config, pkgs, user, ...}:
with lib;
let
  cfg = config.hostModules.virt-manager;
in
{
  options.hostModules.virt-manager = { enable = mkEnableOption "virt-manager"; };
  config = mkIf cfg.enable {
    hostModules.libvirt.enable = true;
    programs.dconf.enable = true;
    environment.systemPackages = with pkgs; [ virt-manager ];
  };
}
