{...}: 
{
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
}
