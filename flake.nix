{
  description = "Laravel development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            (php84.withExtensions (
              { enabled }:
              with enabled;
              [
                ctype
                curl
                dom
                gd
                iconv
                intl
                mbstring
                opcache
                pdo
                xml
                zip
              ]
            ))
            php84Packages.composer
            nodejs_24
          ];
        };

        formatter = pkgs.nixpkgs-fmt;
      }
    );
}
