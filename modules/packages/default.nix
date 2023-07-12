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
        google-chrome
        firefox
        virt-manager
        zeal-qt6
        jetbrains.webstorm
        jetbrains.ruby-mine
        jetbrains.rider
        jetbrains.pycharm-professional
        jetbrains.idea-ultimate
        jetbrains.goland
        jetbrains.dataspell
        jetbrains.clion
      ];
    };
  };
}
