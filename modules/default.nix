{...}:
{
  programs.home-manager.enable = true;
  imports = [
    ./alacritty
    ./bash
    ./direnv
    ./fcitx5
    ./foot 
    ./git
    ./hyprland 
    ./jetbrians 
    ./mako 
    ./neovim
    ./packages 
    ./ranger
    ./starship 
    ./swaylock 
    ./tmux 
    ./theme
    ./waybar 
    ./wayland
    ./wofi 
  ];
}
