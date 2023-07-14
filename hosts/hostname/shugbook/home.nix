{ inputs, ...}:
{
  modules.hyprland.enable = true;
  modules.icons.enable = true;
  modules.neovim.enable = true;
  modules.packages.enable = true;
  modules.jetbrians.enable = true;
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
