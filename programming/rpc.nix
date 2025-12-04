{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/rpc.nix
    packages = with pkgs; [
      # gRPC
      grpc-tools
      protobuf-language-server
    ]; # ..home.packages
  }; # ..home

}
