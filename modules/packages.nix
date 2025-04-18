{ pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.git
    pkgs.vscode
    pkgs.brave
    pkgs.maven
    pkgs.jetbrains.idea-ultimate
    pkgs.chromium
    pkgs.nodejs_22
  ];
}
