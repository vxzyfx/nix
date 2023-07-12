{ system, inputs, ...}@all:
inputs.nixpkgs.lib.nixosSystem {
  system = system;
  specialArgs = all // {
    stateVersion = "23.11";
    home = import ./home.nix;
  }; 
  modules = [
    inputs.impermanence.nixosModules.impermanence
    inputs.home-manager.nixosModules.home-manager
    ./special.nix
    ../modules
    ./hardware-configuration.nix
  ];
}
