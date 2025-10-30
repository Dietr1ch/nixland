{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      duckdb

      # BROKEN: pgadmin
      postgres-language-server

      sqlint
    ];
  };
}
