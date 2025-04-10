{ ... }:

{
  imports = [
    ./compression.nix
    ./env.nix
    ./git.nix
    ./gpg.nix
    ./jujutsu.nix
    ./passwords.nix
    ./ssh.nix
    ./tracing.nix
  ];
}
