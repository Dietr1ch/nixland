{
  description = "Nix userland";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs = {
        "nixpkgs".follows = "nixpkgs";
      };
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs = {
        "nixpkgs".follows = "nixpkgs";
        "home-manager".follows = "home-manager";
      };
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      plasma-manager,
      ...
    }:
    {
      nixosModules =
        let
          import = path: path; # let the module system know what we are exporting
        in
        {
          all = import ./all.nix;

          core = import ./core; # ./desktop/core.nix
          desktop = import ./desktop; # ./desktop/default.nix
          gaming = import ./gaming; # ./gaming/default.nix
          gaming-emulators = import ./gaming; # ./gaming/emulators.nix
          gaming-wine = import ./gaming; # ./gaming/wine.nix
          music = import ./music; # ./music/default.nix
          networking = import ./networking; # ./networking/default.nix
          programming = import ./programming; # ./programming/default.nix
          shell = import ./shell; # ./shell/default.nix
        };
    };
}
