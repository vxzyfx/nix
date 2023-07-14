{ lib, config, pkgs, ...}:
with lib;
let
  cfg = config.hostModules.systemd-network;
in
{
  options.hostModules.systemd-network = { enable = mkEnableOption "systemd-network"; };
  config = mkIf cfg.enable {
    networking.dhcpcd.enable = false;
    services.resolved.enable = true;
    systemd.network = {
      enable = true;
      networks.dhcp = {
        matchConfig.Type = "*";
        networkConfig.DHCP = "yes";
      };
    };
  };
}
