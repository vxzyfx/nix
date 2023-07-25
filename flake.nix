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
      supportedSystems = [ "x86_64-linux" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
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
    devShells = forEachSupportedSystem ({ pkgs }: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          nodejs_20
          gcc13
          python311
        ];
      };
      ngcc = pkgs.mkShell {
        packages = with pkgs; [
          clang-tools_16
          lldb
          gcc13
        ];
      };
      nweb = pkgs.mkShell {
        packages = with pkgs; [
          nodejs_20
          vscode-langservers-extracted
          nodePackages.typescript-language-server
          nodePackages.volar
          marksman
        ];
      };
      ngo = pkgs.mkShell {
        packages = with pkgs; [
          gopls
          go
          gotools
          golangci-lint
        ];
        shellHook = ''
          export GOPATH=$HOME/Documents/env/go
        '';
      };
      nflutter = pkgs.mkShell {
        packages = with pkgs; [
          flutter
        ];
      };
      ndotnet = pkgs.mkShell {
        packages = with pkgs; [
          dotnet-sdk_7
          csharp-ls
        ];
      };
      npy = pkgs.mkShell {
        packages = with pkgs; [
          python311
          python311Packages.pip
          virtualenv
          nodePackages.pyright
          python311Packages.debugpy
        ];
      };
    });
  };
}
