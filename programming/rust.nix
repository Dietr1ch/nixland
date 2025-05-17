{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      cargo

      bacon
    ]; # ..home.packages

    file = {
      ".cargo/config.toml" = {
        text = ''
          # [doc]
          browser = "$BROWSER --new-window"

          [cargo-new]
          vcs = "git"              # VCS to use ('git', 'hg', 'pijul', 'fossil', 'none')
        '';
      }; # ..home.file.".cargo/config.toml"
    }; # ..home.file
  }; # ..home

}
