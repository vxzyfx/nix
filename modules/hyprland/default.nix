{ lib, config, pkgs, ...}: 
with lib;
let
  cfg = config.modules.hyprland;
in
{
  options.modules.hyprland = { enable = mkEnableOption "hyprland"; };
  config = mkIf cfg.enable {
    modules = {
      alacritty.enable = true;
      waybar.enable = true;
      wofi.enable = true;
      swaylock.enable = true;
      mako.enable = true;
    };

#    programs.bash.profileExtra = ''
#    if [[ -z $DISPLAY ]];then
#      env
#      Hyprland
#      exit
#    fi
#    '';
    # systemd.user.services.hyprland = {
    #   Unit = {
    #     Description = "hyprland service";
    #   };
    #
    #   Service = {
    #     ExecStart = "/nix/store/k4jxqhk1aqa08hzfrwajz0npz4hbcgvi-hyprland-0.27.0/bin/Hyprland";
    #   };
    #
    #   Install = {
    #     WantedBy = ["default.target"];
    #   };
    # };
    systemd.user.targets.hyprland-session = {
      Unit = {
        Description = "Hyprland compositor session";
        Documentation = ["man:systemd.special(7)"];
        BindsTo = ["graphical-session.target"];
        Wants = ["graphical-session-pre.target"];
        After = ["graphical-session-pre.target"];
      };
    };
    xdg.configFile."hypr/hyprland.conf".source = ./hyprland.conf;
  };
}
