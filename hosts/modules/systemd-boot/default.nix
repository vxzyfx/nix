{ lib, config, ...}:
with lib;
let
  cfg = config.hostModules.systemd-boot;
in
{
  options.hostModules.systemd-boot = { enable = mkEnableOption "systemd-boot"; };
  config = mkIf cfg.enable {
    boot.loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
