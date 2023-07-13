{ inputs, ...}:
{
  imports = [
      inputs.hyprland.homeManagerModules.default
  ];
  modules.git = {
    enable = true;
    userName = "vxzyfx";
    userEmail = "vxzyfx@gmail.com";
  };
}
