{ lib, config, ...}:
with lib;
let
  cfg = config.modules.git;
in
{
  options.modules.git = { 
    enable = mkEnableOption "git";
    userName = mkOption {
      type = types.str;
      description = "git username";
    };
    userEmail = mkOption {
      type = types.str;
      description = "git email";
    };
  };
  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = cfg.userName;
      userEmail = cfg.userEmail;
    };
  };
}
