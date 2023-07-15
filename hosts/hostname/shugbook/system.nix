{user, stateVersion, inputs, ...}:
{
  hostModules.desktop.enable = true;
  hostModules.bluetooth.enable = true;
  hostModules.wifi.enable = true;
  hostModules.virt-view.enable = true;
  hostModules.libvirt = {
    enable = true;
    interfaces = ["virbr0"];
  };
  hostModules.systemd-network = {
    enable = true;
    enableDHCP = true;
    interface = "wlan0";
  };
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
