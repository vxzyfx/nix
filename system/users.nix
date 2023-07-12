{ config, lib, ...}:
with lib;
let 
cfg = config.meta;
in
{
  options = {
    meta.root.password = mkOption {
      type = types.str;
      default = "root";
      description = mdDoc ''
        root init passwd
      '';
    };
    meta.shug.password = mkOption {
      type = types.str;
      default = "";
      description = mdDoc ''
        shug init passwd
      '';
    };
  };

  config.users.users.root.initialPassword = cfg.root.password;
  config.users.users = {
    "shug" = {
      isNormalUser = true;
      initialPassword = cfg.shug.password; 
      extraGroups = [
        "wheel"
	"video"
	"dialout"
	"uucp"
	"input"
        "libvirtd"
      ];
    };
  };
}
