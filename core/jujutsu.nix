{ ... }:

{
  programs = {
    jujutsu = {
      enable = true;

      settings = {
        ui = {
          allow-init-native = true;
          default-command = "log";
        };
      };
    };
  };
}
