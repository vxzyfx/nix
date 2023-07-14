{user, stateVersion, inputs, ...}:
{
  hostModules.desktop.enable = true;
  hostModules.bluetooth.enable = true;
  hostModules.wifi.enable = true;
  hostModules.virt-view.enable = true;
  hostModules.systemd-network.enable = true;

  nixpkgs.config.allowUnfree = true;
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
