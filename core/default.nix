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
}
