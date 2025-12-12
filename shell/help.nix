{ pkgs, ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.nix-index
    nix-index = {
      enable = true;

      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
    };

    # https://home-manager-options.extranix.com/?release=master&query=programs.man
    man = {
      # ~/Projects/home-manager/modules/programs/man.nix
      enable = true;
      # Index man pages (Used by apropos)
      generateCaches = true;
    }; # ..programs.man

    # https://home-manager-options.extranix.com/?release=master&query=programs.tealdeer
    tealdeer = {
      # ~/Projects/home-manager/modules/programs/tealdeer.nix
      # https://github.com/tealdeer-rs/tealdeer
      enable = true;
      settings = {
        updates = {
          auto_update = true;
          auto_update_interval_hours = 3;
        };
      };
    }; # ..programs.tealdeer
  }; # ..programs

  home = {
    packages = with pkgs; [ manix ];
  };
}
