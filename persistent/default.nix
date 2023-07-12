{...}: {
  environment.persistence."/nix/persistent" = {
    hideMounts = true;
    directories = [
      "/home"
      "/var"
      "/root"
      "/etc/nixos"
    ];
    files = [
      "/etc/machine-id"
    ];
  };
}
