{ lib, config, ...}:
with lib;
let 
  cfg = config.modules.mako;
in
{
  options.modules.mako = { enable = mkEnableOption "mako"; };
  config = mkIf cfg.enable {
    services.mako = {
      enable = true;
      font = "Jetbrains Mono 12";
      width = 350;
      padding = "10";
      margin = "10";
      borderSize = 2;
      borderRadius = 8;
      backgroundColor = "#1d202f";
      borderColor = "#f7768e";
      textColor = "#c0caf5";
      defaultTimeout = 5000;
    };
  };
}
