{ user, ...}:
{
  settings.experimental-features = [ "nix-command" "flakes" ];
  settings.auto-optimise-store = true;
  settings.allowed-users = [ "${user}" ];
  gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
