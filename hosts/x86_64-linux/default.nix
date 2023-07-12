{ inputs, system, hostname, user, initPassword }@all:
with inputs;
let home = par: {
  imports = [ ../../modules/home ];
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "23.05";
  }; 
};
in
  nixpkgs.lib.nixosSystem {
    system = system;
    specialArgs = all;
    modules = [
      home-manager.nixosModules.home-manager
      ./linux
      ./${hostname}
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = all;
        home-manager.users.${user} = home;
      }
    ];
 }
