{ lib, config, pkgs, ...}:
with lib;
let
  cfg = config.modules.ranger;
in
{
  options.modules.ranger = { enable = mkEnableOption "ranger"; };
  config = mkIf cfg.enable {
    xdg.configFile."ranger/commands_full.py".source = ./ranger/commands_full.py;
    xdg.configFile."ranger/commands.py".source = ./ranger/commands.py;
    xdg.configFile."ranger/rc.conf".source = ./ranger/rc.conf;
    xdg.configFile."ranger/rifle.conf".source = ./ranger/rifle.conf;
    xdg.configFile."ranger/scope.sh".source = ./ranger/scope.sh;
    xdg.configFile."ranger/plugins/ranger_devicons".source = ./ranger/plugins/ranger_devicons;
    home = {
      packages = with pkgs; [
        ranger
      ];
    };
  };
}
