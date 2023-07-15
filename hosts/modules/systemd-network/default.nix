{ lib, config, pkgs, ...}:
with lib;
let
  cfg = config.hostModules.systemd-network;
  dhcp = {networks ? {}, ...}@all : all // { enable = true; } // {
    networks = networks // optionalAttrs cfg.enableDHCP {
        dhcp = {
          matchConfig.Name = cfg.interface;
          networkConfig.DHCP = "ipv4";
        };
    }; 
  };
in
{
  options.hostModules.systemd-network = {
    enable = mkEnableOption "systemd-network"; 
    enableDHCP = mkEnableOption "DHCP"; 
    interface = mkOption {
      type = types.str;
      description = "network interface";
      default = "en*";
    };
    network = mkOption {
      type = types.attrs;
      description = "network config";
      default = {};
    };
  };
  config = mkIf cfg.enable {
    networking.dhcpcd.enable = false;
    services.resolved.enable = true;
    systemd.network = dhcp cfg.network;
  };
}
