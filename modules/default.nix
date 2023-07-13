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
    ./swaylock 
    ./tmux 
    ./waybar 
    ./wofi 
  ];
}
