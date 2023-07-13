{ lib, config, pkgs, user, ...}:
with lib;
let
  cfg = config.hostModules.doas;
in
{
  options.hostModules.doas = { enable = mkEnableOption "doas"; };
  config = mkIf cfg.enable {
    security = {
      rtkit.enable = true;
      sudo.enable = false;
      doas = {
        enable = true;
        extraRules = [{
          users = ["${user}"];
          keepEnv = true;
          persist = true;
        }];
      };
    };
  };
}
