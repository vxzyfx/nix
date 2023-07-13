{ inputs, lib, user, config, stateVersion, home, ...}@all:
with lib;
let
  cfg = config.hostModules.home;
in
{
  options.hostModules.home = { enable = mkEnableOption "home"; };
  config = mkIf cfg.enable {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.extraSpecialArgs = { inherit home inputs stateVersion;};
    home-manager.users.${user} = import ./load.nix;
  };
}
