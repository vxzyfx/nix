{
  description = "Nixos";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ...}@inputs: 
    let
      load = import ./lib/load.nix;
    in
    {
    nixosConfigurations = {
      shugtest = load {
        inherit  inputs; 
        system = "x86_64-linux";
        hostname =  "shugtest";
        user = "anli";
        initPassword =  ""; 
      };
      shugbook = load {
        inherit inputs;
        system = "x86_64-linux";
        hostname = "shugbook";
        user = "shug";
        initPassword = "";
      };
    };
  };
}
