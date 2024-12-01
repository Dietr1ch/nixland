{ ... }:

{
  home = {
    file = {
      ".cargo/config.toml" = {
        text = ''
          [alias]
          b  = "build --release --keep-going"
          bb = "build --release --keep-going --all-targets"
          r  = "run"
          rr = "run --release"

          c = "check"
          cc = "check --release"
          t = "test"
          tt = "test --release"

          # [doc]
          browser = "$BROWSER --new-window"

          [cargo-new]
          vcs = "git"              # VCS to use ('git', 'hg', 'pijul', 'fossil', 'none')
        '';
      };  # ..home.file.".cargo/config.toml"
    };  # ..home.file
  };  # ..home

}
