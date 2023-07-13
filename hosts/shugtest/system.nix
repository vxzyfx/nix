{user, stateVersion, ...}@all:
{
  hostModules.server.enable = true;

  system.stateVersion = stateVersion;
}
