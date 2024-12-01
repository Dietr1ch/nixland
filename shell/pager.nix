{ pkgs, ... }:

{
  home = {
    sessionVariables = {
      "PAGER" = "less -R";
    };

    packages = with pkgs; [
      less
    ];
  };
}
