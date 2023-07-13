{ config, pkgs, lib, ...}: 
with lib;
let 
  cfg = config.modules.neovim;
in
{
  options.modules.neovim = { enable = mkEnableOption "neovim"; };
  config = mkIf cfg.enable {
    xdg.configFile."nvim".source = ./nvim;
  };
}
