{...}:
{
  programs.home-manager.enable = true;
  imports = [
    ./alacritty
    ./bash
    ./fcitx5
    ./foot 
    ./git
    ./hyprland 
    ./icons 
    ./jetbrians 
    ./mako 
    ./neovim
    ./packages 
    ./ranger
    ./starship 
    ./swaylock 
    ./tmux 
    ./waybar 
    ./wofi 
  ];
}
