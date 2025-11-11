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

      # Flags passed to `atuin init $SHELL`.
      flags = [
        # https://docs.atuin.sh/configuration/key-binding/#disable-up-arrow
        "--disable-up-arrow"
      ];

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

        # Search
        # ------
        # https://docs.atuin.sh/configuration/config/#workspaces
        workspaces = true;
        # https://docs.atuin.sh/configuration/config/#filter_mode_shell_up_key_binding
        filter_mode_shell_up_key_binding = "directory";
        # https://docs.atuin.sh/configuration/config/#search_mode
        # https://github.com/skim-rs/skim#search-syntax
        search_mode = "skim";

        # Matching
        # https://docs.atuin.sh/configuration/config/#common_subcommands
        common_subcommands = [
          "apt"
          "cargo"
          "composer"
          "dnf"
          "docker"
          "git"
          "go"
          "home-manager"
          "ip"
          "kubectl"
          "nix flake"
          "nix"
          "nix-store"
          "nixos-rebuild"
          "nmcli"
          "npm"
          "pecl"
          "pnpm"
          "podman"
          "port"
          "systemctl"
          "tmux"
          "yarn"
        ];
      };
    }; # ..programs.atuin
  }; # ..programs
}
