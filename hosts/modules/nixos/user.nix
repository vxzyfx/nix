{ user, initPassword, ...}:
{
  users.root.initialPassword = "root";
  users."${user}" = {
    isNormalUser = true;
    initialPassword = initPassword; 
    extraGroups = [
      "wheel"
    ];
  };
}
