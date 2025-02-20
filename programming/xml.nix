{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      xq-xml  # jq, but for xml
    ];  # ..home.packages
  };  # ..home
}
