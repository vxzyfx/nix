{ lib, config, initPassword, user, ...}:
with lib;
let
  cfg = config.hostModules.user;
in
{
  options.hostModules.user = { enable = mkEnableOption "user"; };
  config = mkIf cfg.enable {
    users.users.root.initialPassword = "root";
    users.users."${user}" = {
      isNormalUser = true;
      initialPassword = initPassword; 
      extraGroups = [
        "wheel"
      ];
    };
  };
}
