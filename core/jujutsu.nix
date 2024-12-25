{ ... }:

{
  programs = {
    jujutsu = {
      enable = true;

      # https://github.com/jj-vcs/jj/tree/main/docs/config.md
      # ~/.config/jj/config.toml
      settings = {
        ui = {
          allow-init-native = true;

          default-command = "log";
        };
      };
    };
  };
}
