{ ... }:

{
  imports = [
    ./vcs # ./vcs/default.nix

    ./compression.nix
    ./env.nix
    ./gpg.nix
    ./jujutsu.nix
    ./passwords.nix
    ./ssh.nix
    ./tracing.nix
  ];

  # https://home-manager-options.extranix.com/?release=master&query=xdg
  xdg = {
    enable = true;
  };
}
