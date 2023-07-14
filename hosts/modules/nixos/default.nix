{ lib, config, pkgs, user, hostname, ...}:
with lib;
let
  cfg = config.hostModules.nixos;
in
{
  options.hostModules.nixos = { enable = mkEnableOption "nixos"; };
  config = mkIf cfg.enable {
    networking.hostName = hostname;
    time.timeZone = "Asia/Shanghai";
    nix = {
      settings.experimental-features = [ "nix-command" "flakes" ];
      settings.auto-optimise-store = true;
      settings.allowed-users = [ "${user}" ];
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
    };
  };
}
