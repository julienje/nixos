# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  # security.pam.loginLimits = [
  #   { domain = "@users"; item = "rtprio"; type = "-"; value = 1; }
  # ];
  # see https://wiki.nixos.org/wiki/Sway#Using_Home_Manager
  security.polkit.enable = true;

  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       command = "sway";
  #       user = "julien";
  #     };
  #   };
  # };

  services = {
    xserver = {
      xkb = {
        layout = "ch";
        variant = "fr";
      };
    gnome.gnome-keyring.enable = true;
    };
  };
  # services = {
  #   xserver = {
  #     enable = true;
  #     xkb = {
  #       layout = "ch";
  #       variant = "fr";
  #     };
  #   };
  # };
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  }; 
}

