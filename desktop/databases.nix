{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      pgadmin
      postgres-lsp

      sqlint
    ];
  };
}
