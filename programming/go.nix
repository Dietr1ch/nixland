{ pkgs, ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.go
    go = {
      enable = true;
    };
  };

  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/go.nix
    packages = with pkgs; [
      lisette

      go-tools
    ]; # ..home.packages
  }; # ..home

}
