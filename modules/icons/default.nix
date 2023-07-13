{pkgs, lib, config, ...}:
with lib;
let 
  cfg = config.modules.icons;
in
{
  options.modules.icons = { enable = mkEnableOption "icons"; };
  config = {
    gtk.iconTheme.name = "Papirus";
    gtk.iconTheme.package = pkgs.papirus-icon-theme;
  };
}
