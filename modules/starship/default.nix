{ config, pkgs, lib, ...}: 
with lib;
let 
  cfg = config.modules.starship;
in
{
  options.modules.starship = { enable = mkEnableOption "starship"; };
  config = mkIf cfg.enable {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = false;
        aws.disabled = true;
        gcloud.disabled = true;
        line_break.disabled = true;
      };
    };
  };
}
