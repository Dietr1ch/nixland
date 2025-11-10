{ ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.atuin
    # https://atuin.sh/
    # https://github.com/atuinsh/atuin
    atuin = {
      # ~/Code/github/Dietr1ch/home-manager/modules/programs/atuin.nix
      enable = true;

      enableFishIntegration = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;

      daemon = {
        enable = true;
        logLevel = "info";
      };

      # https://docs.atuin.sh/configuration/config/
      settings = {
        dialect = "uk";

        # Sync
        # TODO: Figure out mesh sync story
        # auto_sync = true;
        # sync_frequency = "5m";
        # sync_address = "https://api.atuin.sh";

        # https://docs.atuin.sh/configuration/config/#search_mode
        # https://github.com/skim-rs/skim#search-syntax
        search_mode = "skim";
      };
    }; # ..programs.atuin
  }; # ..programs
}
