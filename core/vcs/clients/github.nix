{ pkgs, ... }:

{
  home = {
    # In sync with ~/Projects/systemn/system/base/vcs/clients/github.nix
    packages = with pkgs; [
      github-cli
      github-mcp-server
    ];
  };
}
