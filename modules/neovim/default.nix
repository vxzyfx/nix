{ config, pkgs, nixpkgs, ...}: {
  xdg.configFile."nvim".source = ./nvim;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
  }; 
}
