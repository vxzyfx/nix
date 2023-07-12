{...}:
{
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
}
