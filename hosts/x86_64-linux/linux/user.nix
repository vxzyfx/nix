{ user, initPassword, ...}:
{
  users.users.root.initialPassword = "root";
  users.users = {
    "${user}" = {
      isNormalUser = true;
      initialPassword = initPassword; 
      extraGroups = [
        "wheel"
      ];
    };
  };
}
