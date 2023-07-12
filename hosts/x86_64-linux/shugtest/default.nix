{...}: 
{
  imports =
    [ 
      ./hardware-configuration.nix
    ];
  services.openssh.enable = true;
}
