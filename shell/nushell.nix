{ pkgs, lib, ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.nushell
    nushell = {
      # ~/.config/fish/config.fish
      # ~/.config/fish/conf.d/
      # ~/Projects/home-manager/modules/programs/fish.nix
      enable = true;

      # https://home-manager-options.extranix.com/?release=master&query=programs.nushell.shellAliases
      shellAliases = {
        # NOTE: ls aliases get in the way of using Nu
        # ls = "eza";
        # l = "eza --group-directories-first";
        # ll = "eza --long --group-directories-first";
        # la = "eza --all --group-directories-first";
        # lla = "eza --long --all --group-directories-first";
      }; # ..programs.fish.shellAliases

      configFile = {
        text = ''
          $env.config.history = {
            file_format: sqlite
            max_size: 1_000_000
            sync_on_enter: true
            isolation: true
          }
          $env.config.show_banner = false
        '';
      };
    }; # ..programs.fish
  }; # ..programs

  home = {
    packages = with pkgs; [
      nufmt
    ];
  };
}
