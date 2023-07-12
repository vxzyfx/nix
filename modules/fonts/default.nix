{ pkgs, ...}:
{
  fonts = {
    fonts = with pkgs; [
      jetbrains-mono
      openmoji-color
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
    fontconfig = {
        hinting.autohint = true;
        defaultFonts = {
          emoji = [ "OpenMoji Color" ];
        };
     };
  };
}
