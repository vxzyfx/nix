{user, stateVersion, ...}@all:
{
  hostModules.server.enable = true;
  hostModules.libvirt.enable = true;

  networking.nftables.enable = true;
  system.stateVersion = stateVersion;
  systemd.network = {
    networks.host = {
      matchConfig.Name = "en*";
      networkConfig.Bridge = "br0";
    };
    netdevs.br0.netdevConfig = {
      Kind = "bridge";
      Name = "br0";
      MACAddress = "00:E0:4C:00:E6:C7";
    };
  };

}
