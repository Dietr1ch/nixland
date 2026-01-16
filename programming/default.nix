{ pkgs, ... }:

{
  imports = [
    # ./c.nix
    # ./cpp.nix
    # ./haskell.nix
    # ./python.nix
    # ./rust.nix
    # ./sql.nix
    # ./web.nix
    # ./zig.nix

    ./asp.nix

    ./nix.nix

    ./build.nix
    ./debugging.nix
    ./devenv.nix

    ./rpc.nix

    ./constraint.nix
    ./grammars.nix

    ./shell.nix

    ./json.nix
    ./xml.nix
  ];

  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/default.nix
    packages = with pkgs; [
      # Tools
      tokei
    ];

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
