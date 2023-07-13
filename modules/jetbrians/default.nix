{ config, pkgs, lib, ...}: 
with lib;
let 
  cfg = config.modules.jetbrians;
in
{
  options.modules.jetbrians = { enable = mkEnableOption "jetbrians"; };
  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
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
