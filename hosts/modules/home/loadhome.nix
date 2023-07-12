{ stateVersion, home, ...}:
{
  imports = [
      ../../../modules
      home
    ];
  home.stateVersion = stateVersion;
}
