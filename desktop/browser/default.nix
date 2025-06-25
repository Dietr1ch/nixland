{ ... }:

{
  imports = [
    ./chromium.nix
    ./downloaders.nix
    ./librewolf.nix
    ./lynx.nix
    # BROKEN: ./qutebrowser.nix
  ];
}
