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
      ...
    }:
    {
      nix.nixPath = [
        "nixpkgs=${nixpkgs}"
      ];

      nixosModules =
        let
          import = path: path; # let the module system know what we are exporting
        in
        {
          core = import ./core; # ./core/default.nix
          desktop = import ./desktop; # ./desktop/default.nix
          desktop-documents = import ./desktop/documents.nix;
          desktop-editor-emacs-chemacs = import ./desktop/editor/emacs-chemacs.nix;
          desktop-hyprland = import ./desktop/hyprland.nix;
          desktop-video = import ./desktop/video/default.nix;
          gaming = import ./gaming; # ./gaming/default.nix
          gaming-emulators = import ./gaming/emulators.nix;
          gaming-wine = import ./gaming/wine.nix;
          music = import ./music; # ./music/default.nix
          networking = import ./networking; # ./networking/default.nix
          programming = import ./programming; # ./programming/default.nix
          shell = import ./shell; # ./shell/default.nix
        };
    };
}
