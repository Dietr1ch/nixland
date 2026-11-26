{ pkgs, ... }:

{
  home = {
    # In sync with ~/Projects/systemn/system/base/vcs/clients/gitlab.nix
    packages = with pkgs; [
      gitlab-ci-linter
      gitlab-ci-local
      gitlab-ci-validate
    ];
  };
}
