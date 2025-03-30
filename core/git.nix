{ pkgs, ... }:

{
  programs = {
    git = {
      enable = true;

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
      git-appraise   # https://github.com/google/git-appraise
      git-bug        # https://github.com/git-bug/git-bug
      git-workspace  # https://github.com/orf/git-workspace
      gitflow
      gitAndTools.delta
      gitAndTools.git-absorb
      gitAndTools.git-appraise
      gitAndTools.git-ignore
      gitAndTools.git-trim
    ];
  };
}
