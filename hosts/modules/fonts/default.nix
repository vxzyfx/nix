{ pkgs, lib, config, ...}:
with lib;
let
  cfg = config.hostModules.fonts;
in
{
  options.hostModules.fonts = { enable = mkEnableOption "fonts"; };
  config = mkIf cfg.enable {
    fonts = {
      fonts = with pkgs; [
        jetbrains-mono
        openmoji-color
        wqy_zenhei
        wqy_microhei
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      ];
      fontconfig = {
          hinting.autohint = true;
          defaultFonts = {
            emoji = [ "OpenMoji Color" ];
          };
       };
    };
  };
}
