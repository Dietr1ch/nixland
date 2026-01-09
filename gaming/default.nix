{ pkgs, ... }:

{
  imports = [
    ./chess.nix
    ./comms.nix
    # ./emulators.nix
    ./mangohud.nix
    ./obs.nix
    ./sdl.nix
  ];

  home = {
    packages = with pkgs; [ gamescope ];
  };
}
