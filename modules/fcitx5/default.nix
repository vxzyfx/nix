{config, lib, pkgs, ...}:
with lib;
let
  cfg = config.modules.fcitx5;
in
{
  options.modules.fcitx5 = { enable = mkEnableOption "fcitx5"; };
  config = {
    i18n.inputMethod.enabled = "fcitx5";
    i18n.inputMethod.fcitx5.addons = with pkgs; [
      fcitx5-chinese-addons
      fcitx5-configtool
    ];
  };
}
