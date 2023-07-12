{user, stateVersion, ...}:
{
  hostModules.nixos.enable = true;
  hostModules.home.enable = true;

  system.stateVersion = stateVersion;
  networking.wireless.iwd.enable = true;
  boot.extraModprobeConfig = ''
    blacklist nouveau 
  '';
  users.users."${user}".extraGroups = [
    "video"
    "dialout"
    "uucp"
    "input"
    "libvirtd"
  ];
}
