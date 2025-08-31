{ pkgs, ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.ssh
    ssh = {
      enable = true;

      # Settings
      # --------
      # ~/.ssh/config

      matchBlocks = {
        "*" = {
          addKeysToAgent = "no";

          compression = false;
          controlMaster = "auto";
          controlPersist = "3m";
          controlPath = "$\{XDG_RUNTIME_DIR\}/ssh-socket-%l-%r@%h:%p";
          serverAliveInterval = 5; # 5s
          serverAliveCountMax = 3; # Up to 3 in-flight heartbeats

          # ~/.config/ssh/known_hosts
          userKnownHostsFile = "$\{XDG_CONFIG_HOME\}/ssh/known_hosts";

          hashKnownHosts = true;
          forwardAgent = false;

        };
      };

      extraConfig = ''
        Include ''${XDG_CONFIG_HOME}/ssh/config.d/*

        PasswordAuthentication no
        PubkeyAuthentication yes
      '';
    };
  };

  home = {
    packages = with pkgs; [ wol ];
  };
}
