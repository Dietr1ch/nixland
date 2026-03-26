{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/databases.nix
    packages = with pkgs; [
      # SQL
      sqruff

      # Postgres
      postgres-language-server

      # DuckDB
      duckdb
    ]; # ..home.packages
  }; # ..home

}
