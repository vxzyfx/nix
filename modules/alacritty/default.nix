{ lib, config, ...}:
with lib;
let 
   cfg = config.modules.alacritty;
in
{
  options.modules.alacritty = { enable = mkEnableOption "alacritty"; };
  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        font = {
          size = 12.0;
          normal = { 
            family = "JetBrains Mono";
            style = "Regular";
          };
          bold = { 
            family = "JetBrains Mono";
            style = "Bold";
          };
          italic = { 
            family = "JetBrains Mono";
            style = "Italic";
          };
        };
        colors = {
          primary = {
            background = "#2b2e37";
            foreground = "#F2F2F2";
          };
          normal = {
            black = "#333333";
            green = "#98c379";
            yellow = "#d19a66";
            blue = "#61afef";
            red = "#CC0000";
            white = "#D3D7CF";
            magenta = "#c678dd";
            cyan = "#56b6c2";
          };
          bright = {
            black = "#88807C";
            red = "#F15D22";
            green = "#73C48F";
            yellow = "#FFCE51";
            blue = "#48B9C7";
            magenta = "#AD7FA8";
            cyan = "#34E2E2";
            white = "#EEEEEC";
          };
        };
        key_bindings = [
          {
            key = "C";
            mods = "Command";
            action = "Copy";
          }
          {
            key = "V";
            mods = "Command";
            action = "Paste";
          }
        ];
      };
    };
  };
}
