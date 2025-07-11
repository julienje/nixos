{ lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.configurationLimit = 10;

  # do garbage collection to keep disk usage low
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  nix.settings.auto-optimise-store = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #  Set your time zone.
  time.timeZone = "Europe/Zurich";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.julien = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP940HJD23lm9uI507F7xzUqd2CLBigDmnruDq6/OtmZ julien.jeanneret2@sbb.ch" ];
  };
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    brave
    chromium
    xdg-utils
    (jetbrains.plugins.addPlugins jetbrains.rider [
      "github-copilot"
      "gittoolbox"
      "key-promoter-x"
    ])
    (jetbrains.plugins.addPlugins jetbrains.webstorm [
      "github-copilot"
      "gittoolbox"
      "key-promoter-x"
    ])
    dotnetCorePackages.sdk_9_0-bin
    nodejs_22
  ];

  programs.chromium = {
    enable = true;
  };

  services = {
      openssh.enable = true;
      spice-vdagentd.enable = true;
  };
}