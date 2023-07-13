{ lib, config, pkgs, ...}:
with lib;
let
  cfg = config.hostModules.wifi;
in
{
  options.hostModules.wifi = { enable = mkEnableOption "wifi"; };
  config = mkIf cfg.enable {
    networking.wireless.iwd.enable = true;
  };
}
