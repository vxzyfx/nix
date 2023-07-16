{ lib, config, pkgs, ...}: 
with lib;
let
  cfg = config.modules.hyprland;
in
{
  options.modules.hyprland = { enable = mkEnableOption "hyprland"; };
  config = mkIf cfg.enable {
    modules = {
      waybar.enable = true;
      wofi.enable = true;
      swaylock.enable = true;
      mako.enable = true;
      wayland.enable = true;
    };
    home = {
      packages = with pkgs; [
        hyprpaper
      ];
    };

    systemd.user.services.hyprpaper = {
      Unit = {
        Description = "hyprpaper service";
      };

      Service = {
        ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper";
      };

      Install = {
        WantedBy = ["hyprland-session.target"];
      };
    };
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
    xdg.configFile."hypr/wallpaper.jpg".source = ./wallpaper.jpg;
    xdg.configFile."hypr/hyprpaper.conf".text = ''
      preload = ~/.config/hypr/wallpaper.jpg
      wallpaper = eDP-1,~/.config/hypr/wallpaper.jpg
    '';
  };
}
