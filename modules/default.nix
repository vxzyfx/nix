{...}:
{
  programs.home-manager.enable = true;
  imports = [
    ./alacritty
    ./fonts 
    ./foot 
    ./hyprland 
    ./icons 
    ./mako 
    ./neovim
    ./packages 
    ./swaylock 
    ./tmux 
    ./waybar 
    ./wofi 
  ];
}
