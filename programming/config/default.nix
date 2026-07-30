{ ... }:

{
  # Packages in sync with ~/Projects/systemn/desktop/programming/config/default.nix
  imports = [
    ./dhall.nix
    ./json.nix
    ./nix.nix
    ./toml.nix
    ./xml.nix
  ];

}
