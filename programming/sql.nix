{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/sql.nix
    packages = with pkgs; [
      pgsql-tools
      prqlc
      sql-formatter
    ]; # ..home.packages
  }; # ..home

}
