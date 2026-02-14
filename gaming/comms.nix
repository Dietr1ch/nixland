{ pkgs, ... }:

{
  home = {
    # In Sync with ~/Projects/systemn/desktop/gaming/comms.nix
    packages = with pkgs; [
      revolt-desktop
    ];
  };
}
