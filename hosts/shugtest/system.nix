{user, stateVersion, ...}@all:
{
  hostModules.server.enable = true;
  hostModules.libvirt.enable = true;

  networking.nftables.enable = true;
  networking.dhcpcd.enable = false;
  system.stateVersion = stateVersion;
  services.resolved.enable = true;
  systemd.network = {
    enable = true;
    networks.host = {
      matchConfig.Name = "en*";
      networkConfig.Bridge = "br0";
    };
    networks.br0 = {
      matchConfig.Name = "br0";
      networkConfig.DHCP = "ipv4";
    };
    netdevs.br0.netdevConfig = {
      Kind = "bridge";
      Name = "br0";
      MACAddress = "00:E0:4C:00:E6:C7";
    };
  };

}
