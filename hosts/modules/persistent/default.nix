{ lib, config, pkgs, ...}:
with lib;
let
  cfg = config.hostModules.persistent;
in
{
  options.hostModules.persistent = { enable = mkEnableOption "persistent"; };
  config = mkIf cfg.enable {
    environment.persistence."/nix/persistent" = {
      hideMounts = true;
      directories = [
        "/var"
        "/home"
      ];
      files = [
        "/etc/machine-id"
        "/etc/ssh/ssh_host_ed25519_key"
        "/etc/ssh/ssh_host_ed25519_key.pub"
        "/etc/ssh/ssh_host_rsa_key"
        "/etc/ssh/ssh_host_rsa_key.pub"
      ];
    }; 
  };
}
