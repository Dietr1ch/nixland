{ ... }:

{
  imports = [
    ./browser  # ./browser/default.nix
    ./communication  # ./communication/default.nix
    ./diff  # ./diff/default.nix
    ./editor  # ./editor/default.nix
    ./terminal  # ./terminal/default.nix

    ./databases.nix
    ./documentation.nix
    ./documents.nix
    ./fonts.nix
    ./passwords.nix
    ./phone.nix
    ./screenshots.nix
    ./sync.nix
    ./tools.nix
    ./yubikey.nix
  ];
}
