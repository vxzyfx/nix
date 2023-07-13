{ lib, config, pkgs, ...}:
with lib;
let
  cfg = config.hostModules.openssh;
in
{
  options.hostModules.openssh = { enable = mkEnableOption "openssh"; };
  config = mkIf cfg.enable {
    services.openssh.enable = true;
  };
}
