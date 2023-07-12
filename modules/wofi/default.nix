{ config, lib, ...}: 
with lib;
let
  cfg = config.modules.wofi;
in
{
  options.modules.wofi = { enable = mkEnableOption "wofi"; };
  config = mkIf cfg.enable {
    programs.wofi = {
      enable = true;
      settings = {
        key_up = "Control_L-p";
        key_down = "Control_L-n";
        term = "alacritty";
      };
      style = readFile ./style.css;
    };
  };
}
