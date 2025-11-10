{ ... }:

{
  imports = [
    ./autocomplete.nix
    ./fish.nix
    ./help.nix
    # TODO: Add ./history.nix
    ./nushell.nix
    ./pager.nix
    ./prompt.nix
    ./tools.nix
    ./zellij.nix
  ];
}
