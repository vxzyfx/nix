{ config, pkgs, lib, ...}: 
with lib;
let 
  cfg = config.hostModules.bash;
in
{
  options.hostModules.bash = { enable = mkEnableOption "bash"; };
  config = mkIf cfg.enable {
    programs.bash = {
      enable = true;
      enableCompletion = true;
    };
  };
}
