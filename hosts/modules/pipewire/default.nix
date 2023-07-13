{ lib, config, pkgs, user, ...}:
with lib;
let
  cfg = config.hostModules.pipewire;
in
{
  options.hostModules.pipewire = { enable = mkEnableOption "pipewire"; };
  config = mkIf cfg.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
