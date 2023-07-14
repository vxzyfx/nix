{ lib, config, pkgs, user, ...}:
with lib;
let
  cfg = config.hostModules.libvirt;
in
{
  options.hostModules.libvirt = { enable = mkEnableOption "libvirt"; };
  config = mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;
    users.users."${user}".extraGroups = [ "libvirtd" ];
  };
}
