{ config, pkgs, ... }:

{
  imports = [
    ./asp.nix
    ./haskell.nix
    ./python.nix
    ./rust.nix

    ./nix.nix

    ./build.nix

    ./web.nix

    ./json.nix
    ./xml.nix
  ];

  home = {
    packages = with pkgs; [ tokei ];

    file = {

      ".config/gdb/gdbinit" = {
        text = ''
          layout src
          set confirm off

          set prompt \001\033[01;36m\002(gdb)\001\033[0m\002

          set history save on
          set history size 500000
          set history filename ~/.cache/gdb/history
        '';
      }; # ..home.file.".config/gdb/gdbinit"

    }; # ..home.file
  }; # ..home
}
