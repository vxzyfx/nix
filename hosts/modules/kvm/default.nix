{ lib, config, pkgs, user, ...}:
with lib;
let
  cfg = config.hostModules.kvm;
in
{
  options.hostModules.kvm = { enable = mkEnableOption "kvm"; };
  config = mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;
    programs.dconf.enable = true;
    users.users."${user}".extraGroups = [ "libvirtd" ];
    environment.systemPackages = with pkgs; [ virt-manager ];
  };
}
