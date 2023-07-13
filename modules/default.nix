{...}:
{
  programs.home-manager.enable = true;
  imports = [
    ./alacritty
    ./foot 
    ./git
    ./hyprland 
    ./icons 
    ./jetbrians 
    ./mako 
    ./neovim
    ./packages 
    ./starship 
    ./swaylock 
    ./tmux 
    ./waybar 
    ./wofi 
  ];
}
