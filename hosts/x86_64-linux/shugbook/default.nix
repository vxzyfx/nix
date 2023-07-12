{ user, ...}:
{
  imports = [
    ./virt.nix
  ];
  networking.wireless.iwd.enable = true;
  boot.extraModprobeConfig = ''
    blacklist nouveau 
  '';
  users.users."${user}".extraGroups = [
    "video"
    "dialout"
    "uucp"
    "input"
    "libvirtd"
  ];
}
