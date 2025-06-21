{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      duckdb

      # BROKEN: pgadmin
      postgres-lsp

      sqlint
    ];
  };
}
