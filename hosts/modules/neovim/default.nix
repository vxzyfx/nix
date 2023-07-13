{ lib, config, pkgs, ...}:
with lib;
let
  cfg = config.hostModules.neovim;
in
{
  options.hostModules.neovim = { enable = mkEnableOption "neovim"; };
  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      vimAlias = true;
      viAlias = true;
      defaultEditor = true;
    };
  };
}
