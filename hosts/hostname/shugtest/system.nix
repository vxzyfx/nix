{user, stateVersion, ...}@all:
{
  hostModules.server.enable = true;
  hostModules.libvirt = {
    enable = true;
    interfaces = ["virbr0"];
  };

  hostModules.systemd-network = {
    enable = true;
    enableDHCP = true;
    interface = "br0";
    network = {
      networks.bridge = {
        matchConfig.Name = "enp2s0";
        networkConfig.Bridge = "br0";
      };
      netdevs.br0.netdevConfig = {
        Kind = "bridge";
        Name = "br0";
        MACAddress = "00:E0:4C:00:E6:C7";
      };
    };
  };

  system.stateVersion = stateVersion;
}
