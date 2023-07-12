{ lib, user, config, pkgs, ...}@all:
with lib;
let
  cfg = config.hostModules.nixos;
in
{
  options.hostModules.nixos = { 
    enable = mkEnableOption "nxios";
    desktop = mkEnableOption "desktop";
  };
  config = mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;
    services = mkIf cfg.desktop (import ./media.nix all);
    hardware = mkIf cfg.desktop (import ./hardware.nix all);
    console = (import ./console.nix all);
    boot =  (import ./boot.nix all);
    nix =  (import ./nix.nix all);
    environment.systemPackages = (import ./packages.nix {inherit pkgs;});
    environment.persistence = (import ./persistent.nix all);
    security = (import ./security.nix all);
    users = (import ./user.nix all);
  };
}
