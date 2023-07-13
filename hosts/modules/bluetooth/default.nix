{ lib, config, pkgs, user, ...}:
with lib;
let
  cfg = config.hostModules.bluetooth;
in
{
  options.hostModules.bluetooth = { 
    enable = mkEnableOption "bluetooth";
    pulseaudio = mkEnableOption "pulseaudio";
   };
  config = mkIf cfg.enable {
      hardware.pulseaudio.enable = cfg.pulseaudio;
      hardware.bluetooth.enable = true;
  };
}
