{ pkgs, ... }:

{
  imports = [
    ./chess.nix
    ./comms.nix
    # ./emulators.nix
    ./mangohud.nix
    ./obs.nix
    ./revolt.nix
    ./sdl.nix
  ];

  home = {
    packages = with pkgs; [ gamescope ];
  };
}
