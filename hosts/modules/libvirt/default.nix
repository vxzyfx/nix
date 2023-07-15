{ lib, config, pkgs, user, ...}:
with lib;
let
  cfg = config.hostModules.libvirt;
in
{
  options.hostModules.libvirt = { 
    enable = mkEnableOption "libvirt"; 
    interfaces = mkOption {
      type = types.listOf types.str;
      example = ["virbr0"];
    };
  };
  config = mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;
    networking.firewall.trustedInterfaces = cfg.interfaces;
    users.users."${user}".extraGroups = [ "libvirtd" ];
  };
}
