{ config, pkgs, lib, ...}: 
with lib;
let 
  cfg = config.modules.packages;
in
{
  options.modules.packages = { enable = mkEnableOption "packages"; };
  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        firefox
        zeal-qt6
        xorg.xlsclients
      ];
    };
  };
}
