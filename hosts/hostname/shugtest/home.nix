{ inputs, ...}:
{
  modules.starship.enable = true;
  modules.bash.enable = true;
  modules.neovim.enable = true;
  modules.git = {
    enable = true;
    userName = "vxzyfx";
    userEmail = "vxzyfx@gmail.com";
  };
}
