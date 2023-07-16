{ lib, config, pkgs, ...}: 
with lib;
let
  cfg = config.modules.wayland;
in
{
  options.modules.wayland = { enable = mkEnableOption "wayland"; };
  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        (google-chrome.override {
           commandLineArgs = "--ozone-platform=wayland --gtk-version=4";
         })
      ];
    };
  };
}
