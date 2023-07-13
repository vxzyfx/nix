{user, stateVersion, inputs, ...}:
{
  hostModules.desktop.enable = true;
  hostModules.bluetooth.enable = true;
  hostModules.wifi.enable = true;
  hostModules.virt-manager.enable = true;

  system.stateVersion = stateVersion;
  boot.extraModprobeConfig = ''
    blacklist nouveau 
  '';
  users.users."${user}".extraGroups = [
    "video"
    "dialout"
    "uucp"
    "input"
  ];
}
