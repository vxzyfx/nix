{ lib, config, pkgs, user, ...}:
with lib;
let
  cfg = config.hostModules.nfs;
in
{
  options.hostModules.nfs = {
    enable = mkEnableOption "nfs";
    exports = mkOption {
      type = types.str;
      default = "";
    };
  };
  config = mkIf cfg.enable {
    networking.firewall = {
      allowedTCPPorts = [ 111  2049 4000 4001 4002 20048 ];
      allowedUDPPorts = [ 111 2049 4000 4001  4002 20048 ];
    };
    services.nfs.server = {
      enable = true;
      lockdPort = 4001;
      mountdPort = 4002;
      statdPort = 4000;
      exports = cfg.exports;
    };
  };
}
