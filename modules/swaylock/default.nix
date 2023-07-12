{ lib, config, ...}:
with lib;
let cfg = config.modules.swaylock;
in
{
  options.modules.swaylock = { enable = mkEnableOption "swaylock"; };
  config = mkIf cfg.enable {
    programs.swaylock = {
      enable = true;
      settings = {
        font-size = 16;
        color = "2b2e37";
        key-hl-color = "4E9A06";
        line-color = "73C48F";
        layout-bg-color = "2b2e37";
        ring-color = "2b2e37";
        ring-ver-color = "2b2e37";
        inside-wrong-color = "F15D22";
        inside-ver-color = "2b2e37";
        inside-color = "2b2e37";
        show-keyboard-layout = true;
        indicator-idle-visible = true;
        indicator-radius = 120;
        text-color = "eeeeee";
        daemonize = true;
        show-failed-attempts = true;
      };
    };
  };
}
