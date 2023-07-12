{ inputs, lib, user, config, stateVersion, home, ...}@all:
with lib;
let
  cfg = config.hostModules.home;
  load = p : {
  imports = [
      ../../../modules
      home
    ];
  home.stateVersion = stateVersion;
  };
in
{
  options.hostModules.home = { enable = mkEnableOption "home"; };
  config = mkIf cfg.enable {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.extraSpecialArgs = all;
    home-manager.users.${user} = load;
  };
}
