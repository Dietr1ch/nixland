{ pkgs, ... }:

{
  programs = {
    bacon = {
      enable = true;
    };
  };

  home = {
    packages = with pkgs; [
      rustc
      rust-analyzer
      clippy
      rustfmt
      rust-script

      cargo
      cargo-audit
      cargo-benchcmp
      cargo-bloat
      cargo-criterion
      cargo-deny
      cargo-edit
      cargo-expand
      cargo-flamegraph
      cargo-fuzz
      cargo-modules
      cargo-nextest
      cargo-outdated
      cargo-pgo
      cargo-public-api
      cargo-semver-checks
      cargo-show-asm
      cargo-spellcheck
      cargo-toml-lint
      cargo-udeps
      cargo-valgrind
      cargo-watch

      critcmp
    ]; # ..home.packages

    file = {
      ".config/rustfmt/rustfmt.toml" = {
        text = ''
          # https://github.com/rust-lang/rustfmt/blob/master/Configurations.md

          edition = "2024"

          hard_tabs = true
          unstable_features = true
          format_code_in_doc_comments = true
        '';
      }; # ..home.file.".config/rustfmt/rustfmt.toml"

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
