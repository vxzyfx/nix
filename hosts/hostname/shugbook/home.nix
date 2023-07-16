{ inputs, ...}:
{
  modules.hyprland.enable = true;
  modules.alacritty.enable = true;
  modules.theme.enable = true;
  modules.neovim.enable = true;
  modules.packages.enable = true;
  modules.jetbrians.enable = true;
  modules.direnv.enable = true;
  modules.foot.enable = true;
  modules.bash.enable = true;
  modules.tmux.enable = true;
  modules.fcitx5.enable = true;
  modules.ranger.enable = true;
  modules.git = {
    enable = true;
    userName = "vxzyfx";
    userEmail = "vxzyfx@gmail.com";
  };
}
