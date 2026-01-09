{
  description = "Laravel development environment with PHP, Node.js, and essential tools";

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
            # PHP and Composer
            php84
            php84Packages.composer

            # Node.js and PNPM
            nodejs
            pnpm

            # Database tools
            mysql-client

            # Development utilities
            jq
            curl
            git
          ];

          shellHook = ''
            echo "Laravel development environment loaded"
            echo "PHP: $(php --version | head -n 1)"
            echo "Node: $(node --version)"
            echo "PNPM: $(pnpm --version)"
          '';
        };

        formatter = pkgs.nixfmt-rfc-style;
      }
    );
}
