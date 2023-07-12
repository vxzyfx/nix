{ config, lib, ...}: 
with lib;
let
  cfg = config.modules.waybar;
in
{
  options.modules.waybar = { enable = mkEnableOption "waybar"; };
  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 26;
          spacing = 4;
          modules-left = ["hyprland/workspaces" "idle_inhibitor" "wireplumber" "backlight" "network"];
          modules-center = ["hyprland/window"];
          modules-right = ["cpu" "memory" "temperature" "battery" "clock"];
          "hyprland/workspaces" = {
            format = "{id}";
          };
          "idle_inhibitor" = {
            format = "{icon}";
            format-icons = {
              activated = "";
              deactivated = "";
            };
          };
          "wireplumber" = {
            format = "{volume}% {icon}";
            format-muted = "";
            format-icons = ["" "" ""];
            on-click = "helvum";
            max-volume = 150;
            scroll-step = 0.2;
          };
          "backlight" = {
            format = "{percent}% {icon}";
            format-icons = ["" "" "" "" "" "" "" "" ""];
          };
          "network" = {
            format-wifi = "{essid} ({signalStrength}%) ";
            format-ethernet = "{ipaddr}/{cidr} ";
            tooltip-format = "{ifname} via {gwaddr} ";
            format-linked = "{ifname} (No IP) ";
            format-disconnected = "Disconnected ⚠";
            format-alt = "{ifname}: {ipaddr}/{cidr}";
          };
          "hyprland/window" = {
            format = "{}";
            separate-outputs = true;
          };
          "cpu" = {
            format = "{usage}% ";
            tooltip = false;
          };
          "memory" = {
            format = "{}% ";
          };
          "temperature" = {
            critical-threshold = 80;
            format = "{temperatureC}°C {icon}";
            format-icons = ["" "" ""];
          }; 
          "battery" = {
            states = {
              good = 95;
              warning = 30;
              critical = 15;
            };
            format = "{capacity}% {icon}";
            format-charging = "{capacity}% 🗲";
            format-plugged = "{capacity}% ";
            format-alt = "{time} {icon}";
            format-good = "";
            format-full = "";
            format-icons = ["" "" "" "" ""];
          };
          "clock" = {
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format-alt = "{:%Y-%m-%d}";
          };
        };
      };
      style = readFile ./style.css;
    };
  };
}
