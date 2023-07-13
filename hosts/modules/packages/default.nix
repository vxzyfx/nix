{ lib, config, pkgs, user, ...}:
with lib;
let
  cfg = config.hostModules.packages;
in
{
  options.hostModules.packages = { enable = mkEnableOption "packages"; };
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wget
      git
    ];
  };
}
