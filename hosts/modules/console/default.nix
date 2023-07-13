{ lib, config, pkgs, user, ...}:
with lib;
let
  cfg = config.hostModules.console;
in
{
  options.hostModules.console = { enable = mkEnableOption "console"; };
  config = mkIf cfg.enable {
    console = {
      font = "Lat2-Terminus16";
      keyMap = "us";
    };
  };
}
