{ pkgs, ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.opencode
    opencode = {
      enable = true;

      enableMcpIntegration = true;
    }; # ..programs.opencode
  }; # ..programs

  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/agentic.nix
    packages = with pkgs; [
      deepseek-harness
      snip
    ];
  }; # ..home
}
