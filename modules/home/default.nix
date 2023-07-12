{ hostname, ...}:
{
  imports = [
    ./${hostname}
  ];
  programs.home-manager.enable = true;
}
