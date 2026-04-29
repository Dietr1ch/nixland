{ pkgs, ... }:

{
  # In sync with ~/Projects/systemn/desktop/programming/config/json.nix
  programs = {
    # https://search.nixos.org/options?channel=unstable&query=programs.jq
    jq = {
      # ~/Projects/home-manager/modules/programs/jq.nix
      # https://github.com/jqlang/jq
      enable = true;
    };
    # https://search.nixos.org/options?channel=unstable&query=programs.jqp
    jqp = {
      # ~/Projects/home-manager/modules/programs/jq.nix
      # https://github.com/jqlang/jq
      enable = true;

      # https://github.com/noahgorstein/jqp#configuration
      settings = {
        theme = {
          name = "nord";
        };
      };
    };
  };
}
