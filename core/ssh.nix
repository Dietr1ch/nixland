{ ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.ssh
    ssh = {
      enable = true;

      compression = true;
      controlMaster = "auto";
      controlPersist = "3m";
      controlPath = "$\{XDG_RUNTIME_DIR\}/ssh-socket-%l-%r@%h:%p";
      serverAliveInterval = 15;  # 15s
      serverAliveCountMax = 3;  # Up to 3 in-flight heartbeats

      userKnownHostsFile = "$\{XDG_CONFIG_HOME\}/ssh/known_hosts";

      hashKnownHosts = true;
      forwardAgent = false;

      extraConfig = ''
        Include ''${XDG_CONFIG_HOME}/ssh/config.d/*
      '';
    };
  };
}
