{ lib, config, pkgs, user, ...}:
with lib;
let
  cfg = config.hostModules.nftables;
in
{
  options.hostModules.nftables = { enable = mkEnableOption "nftables"; };
  config = mkIf cfg.enable {
    networking.nftables.enable = true;
  };
}
