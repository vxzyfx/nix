{user, stateVersion, ...}@all:
{
  hostModules.server.enable = true;
  hostModules.libvirt.enable = true;

  system.stateVersion = stateVersion;
}
