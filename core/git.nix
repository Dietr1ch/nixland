{ pkgs, ... }:

{
  programs = {
    mergiraf = {
      enable = true;
    };

    # ~/.config/git/
    # - ~/.config/git/config
    git = {
      enable = true;

      # ~/.config/git/ignore
      ignores = [
        # Unix
        ".*"
        "!.ignore"
        "!.gitignore"

        # Temporary files
        "*~"
        "*.swp"

        # Outputs
        # Rust
        "/target/"
        # Nix
        "result"

        # Org
        "TODOs.org"
        "*.org_archive"

        # Hidden Config
        ## Editors  (I think we need these to be per-project)
        ### Emacs
        ### Helix
        ### VSCode
        ## Environment
        ### Rust
        "!.rustfmt.toml"
        ### Nix - devenv (https://devenv.sh)
        # "!.envrc"
        ### Github
        "!.github"
      ];

      # ~/.config/git/attributes
      attributes = [
        # Mergiraf
        # https://mergiraf.org/usage.html#registration-as-a-git-merge-driver
        # mergiraf languages --gitattributes
        "*.c merge=mergiraf"
        "*.c++ merge=mergiraf"
        "*.cc merge=mergiraf"
        "*.cpp merge=mergiraf"
        "*.cppm merge=mergiraf"
        "*.cs merge=mergiraf"
        "*.cxx merge=mergiraf"
        "*.dart merge=mergiraf"
        "*.dts merge=mergiraf"
        "*.go merge=mergiraf"
        "*.h merge=mergiraf"
        "*.h++ merge=mergiraf"
        "*.hcl merge=mergiraf"
        "*.hh merge=mergiraf"
        "*.hpp merge=mergiraf"
        "*.htm merge=mergiraf"
        "*.html merge=mergiraf"
        "*.hxx merge=mergiraf"
        "*.ini merge=mergiraf"
        "*.ixx merge=mergiraf"
        "*.java merge=mergiraf"
        "*.js merge=mergiraf"
        "*.json merge=mergiraf"
        "*.jsx merge=mergiraf"
        "*.kt merge=mergiraf"
        "*.lua merge=mergiraf"
        "*.md merge=mergiraf"
        "*.mjs merge=mergiraf"
        "*.mpp merge=mergiraf"
        "*.nix merge=mergiraf"
        "*.php merge=mergiraf"
        "*.phtml merge=mergiraf"
        "*.properties merge=mergiraf"
        "*.py merge=mergiraf"
        "*.rb merge=mergiraf"
        "*.rs merge=mergiraf"
        "*.sbt merge=mergiraf"
        "*.scala merge=mergiraf"
        "*.sol merge=mergiraf"
        "*.sv merge=mergiraf"
        "*.svh merge=mergiraf"
        "*.tcc merge=mergiraf"
        "*.tf merge=mergiraf"
        "*.tfvars merge=mergiraf"
        "*.toml merge=mergiraf"
        "*.ts merge=mergiraf"
        "*.tsx merge=mergiraf"
        "*.xhtml merge=mergiraf"
        "*.xml merge=mergiraf"
        "*.yaml merge=mergiraf"
        "*.yml merge=mergiraf"
      ];
      aliases = {
        "exec" = "!exec ";

        "h" = "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";
        "ll" = "log --graph --abbrev-commit --decorate --max-count 200";
        "lla" = "log --graph --abbrev-commit --decorate --max-count 200 --all";

        "publish" = "!sh -c 'git push -u origin $(git branch-name)'";
        "unpublish" = "!sh -c 'git push -u origin :$(git branch-name)'";

        "branch-name" = "rev-parse --abbrev-ref HEAD";
        "ls" = "!sh -c 'git ls-tree --name-only -r $(git branch-name)'";

        "shallow-clone" = "clone --single-branch --shallow-since $(date --iso-8601 --date '-7 days')";
        "commit-clone" = "clone --single-branch --depth 1";
      };
      difftastic = {
        enable = true;
        background = "dark";
      };

      lfs = {
        enable = true;
      };

      extraConfig = {
        init = {
          defaultBranch = "master";
        };
        core = {
          whitespace = "trailing-space,space-before-tab";
        };
        url = {
          "git@github.com:" = {
            insteadOf = "gh:";
          };
          "git@gist.github.com:" = {
            insteadOf = "gist:";
          };
        };
        pretty = {
          "oneliner" =
            "format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%<(12)%ar)%C(reset)  %s%C(dim white) - %an  %C(auto)%d%C(reset)'";
        };
      };
    };
  };

  home = {
    packages = with pkgs; [
      git-appraise # https://github.com/google/git-appraise
      git-bug # https://github.com/git-bug/git-bug
      git-workspace # https://github.com/orf/git-workspace
      gitflow
      gitAndTools.delta
      gitAndTools.git-absorb
      gitAndTools.git-appraise
      gitAndTools.git-ignore
      gitAndTools.git-trim
    ];
  };
}
