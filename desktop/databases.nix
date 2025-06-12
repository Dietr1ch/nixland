{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      duckdb

      pgadmin
      postgres-lsp

      sqlint
    ];
  };
}
