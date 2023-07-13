{ inputs, ...}:
{
  modules.hyprland.enable = true;
  modules.neovim.enable = true;
  modules.packages.enable = true;
  modules.jetbrans.enable = true;
  modules.git = {
    enable = true;
    userName = "vxzyfx";
    userEmail = "vxzyfx@gmail.com";
  };
}
