{ config, lib, ... }:

{
  xdg = {
    enable = true;
  };

  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.direnv
    direnv = {
      enable = true;

      nix-direnv = {
        enable = true;
      };

      # https://github.com/direnv/direnv/tree/master/man/direnv.toml.1.md#config
      config = {
        "global" = {
          "strict_env" = true;
        };
      };
    }; # ..programs.direnv
  }; # ..programs

  home = {
    # XDG enforcement
    # NOTE: Check xdg-ninja
    sessionVariables = {
      # XDG_CACHE_HOME (~/.cache/)
      "NPM_CONFIG_CACHE" = "${config.xdg.cacheHome}/npm";

      # XDG_CONFIG_HOME (~/.config/)
      "PARALLEL_HOME" = "${config.xdg.configHome}/parallel";
      "_JAVA_OPTIONS" = "-Djava.util.prefs.userRoot=${config.xdg.configHome}/java";
      "NPM_CONFIG_INIT_MODULE" = "${config.xdg.configHome}/npm/config/npm-init.js";

      # XDG_DATA_HOME (~/.local/share/)
      "ANDROID_USER_HOME" = "${config.xdg.dataHome}/android";
      "CARGO_HOME" = "${config.xdg.dataHome}/cargo";
      "DOTNET_CLI_HOME" = "${config.xdg.dataHome}/dotnet";
      "GNUPGHOME" = lib.mkForce "${config.xdg.dataHome}/gnupg";
      "RUSTUP_HOME" = "${config.xdg.dataHome}/rustup";

      # XDG_RUNTIME_DIR (/run/user/$EUID/)
      # "NPM_CONFIG_TMP" = "${config.xdg.runtimeDir}/npm";

      # XDG_STATE_HOME (~/.local/state/)
      "NODE_REPL_HISTORY" = "${config.xdg.stateHome}/node_repl_history";
      "PSQL_HISTORY" = "${config.xdg.stateHome}/psql_history";
    }; # ..home.sessionVariables
  }; # ..home
}
