{
  description = "T-Pi's darwin system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    superfile.url = "github:yorukot/superfile";
    };

  outputs = inputs@{ self, nix-darwin, nixpkgs, superfile }:

  let
    system = "aarch64-darwin";  # Your arch
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
       with pkgs; [
          alacritty
          zellij
          starship
          nushell
          (superfile.packages.${system}.default.overrideAttrs(old: { doCheck = false; }))
        ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;
   
      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      security.pam.services.sudo_local.touchIdAuth = true;
      
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#focx
    darwinConfigurations."focx" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

  };
}

