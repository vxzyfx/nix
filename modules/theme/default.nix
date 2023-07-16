{pkgs, lib, config, ...}:
with lib;
let 
  cfg = config.modules.theme;
in
{
  options.modules.theme = { enable = mkEnableOption "theme"; };
  config = {
    gtk.iconTheme.package = pkgs.papirus-icon-theme;
    gtk.iconTheme.name = "ePapirus Dark";
    gtk.theme.package = pkgs.arc-theme;
    gtk.theme.name = "Arc Dark";
    gtk.cursorTheme.package = pkgs.quintom-cursor-theme;
    gtk.cursorTheme.name = "Ink";
  };
}
