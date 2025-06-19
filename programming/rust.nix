{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      cargo
      cargo-audit
      cargo-benchcmp
      cargo-criterion
      cargo-deny
      cargo-edit
      cargo-expand
      cargo-flamegraph
      cargo-outdated
      cargo-public-api
      cargo-spellcheck
      cargo-toml-lint
      cargo-watch
      critcmp

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
