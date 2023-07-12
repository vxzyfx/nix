{ config, pkgs, nixpkgs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
      ./packages.nix
      ./users.nix
      ./virt.nix
    ];

  nixpkgs.config.allowUnfree = true;
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    settings.auto-optimise-store = true;
    settings.allowed-users = [ "shug" ];
    gc = {
      automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
    };
  };
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };
  boot.extraModprobeConfig = ''
    blacklist nouveau 
  '';

  networking.hostName = "shugbook"; 
  networking.wireless.iwd.enable = true;
  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Install fonts
  fonts = {
    fonts = with pkgs; [
      jetbrains-mono
      openmoji-color
#      vistafonts-chs
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
    fontconfig = {
        hinting.autohint = true;
        defaultFonts = {
          emoji = [ "OpenMoji Color" ];
        };
     };
  };

  security = {
    rtkit.enable = true;
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [{
        users = ["shug"];
	keepEnv = true;
	persist = true;
      }];
    };
  };
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    pulse.enable = true; 
  };
  hardware = {
    bluetooth.enable = true;
    opengl = {
      enable = true;
      driSupport = true;
    };
  };
  system.stateVersion = "23.05"; 
}

