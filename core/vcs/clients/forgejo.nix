{ pkgs, ... }:

{
  home = {
    # In sync with ~/Projects/systemn/system/base/vcs/clients/forgejo.nix
    packages = with pkgs; [
      forgejo-cli
      forgejo-mcp
    ];
  };
}
