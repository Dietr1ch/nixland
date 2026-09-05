{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/databases.nix
    packages = with pkgs; [
      # Prolog
      swi-prolog-gui

      # SQL
      sqls
      sqruff
      pgsql-tools
      prqlc
      sql-formatter

      # Postgres
      pgmodeler
      postgres-language-server

      # DuckDB
      duckdb
    ]; # ..home.packages
  }; # ..home

}
