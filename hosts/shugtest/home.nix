{ inputs, ...}:
{
  imports = [
      inputs.hyprland.homeManagerModules.default
  ];
  modules.starship.enable = true;
  modules.git = {
    enable = true;
    userName = "vxzyfx";
    userEmail = "vxzyfx@gmail.com";
  };
}
