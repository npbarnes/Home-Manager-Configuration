{
  description = "Home Manager configuration of deck";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flexplot-src = {
      type = "github";
      owner = "dustinfife";
      repo = "flexplot";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, nix-vscode-extensions, flexplot-src, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nix-vscode-extensions.overlays.default ];
      };
      flexplot = pkgs.rPackages.buildRPackage {
        name = "flexplot";
        src = flexplot-src;
        propagatedBuildInputs = [
          pkgs.rPackages.cowplot
          pkgs.rPackages.MASS
          pkgs.rPackages.tibble
          pkgs.rPackages.withr
          pkgs.rPackages.dplyr
          pkgs.rPackages.magrittr
          pkgs.rPackages.forcats
          pkgs.rPackages.purrr
          pkgs.rPackages.plyr
          pkgs.rPackages.R6
          pkgs.rPackages.ggplot2
          pkgs.rPackages.patchwork
          pkgs.rPackages.ggsci
          pkgs.rPackages.lme4
          pkgs.rPackages.party
          pkgs.rPackages.mgcv
          pkgs.rPackages.rlang
        ];
      };
    in {
      homeConfigurations."deck" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = { inherit flexplot; };
      };
    };
}
