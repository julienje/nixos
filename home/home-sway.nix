{ lib, config, pkgs, ... }:

{
  home.username = "julien";
  home.homeDirectory = "/home/julien";

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Julien Jeanneret";
    userEmail = "julien.jeanneret@outlook.com";
  };

  programs.vscode = {
    enable = true;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      # see https://code.visualstudio.com/docs/getstarted/settings#_settingsjson
      userSettings = {
        "files.autoSave" = "afterDelay";
        "files.autoSaveDelay" = 100;
        "git.autofetch" = true;
      };

      # maybe someday with pkgs.vscode-marketplace
      extensions = with pkgs.vscode-extensions; [
        # Search for vscode-extensions on https://search.nixos.org/packages
        jnoortheen.nix-ide
        github.copilot-chat
        github.copilot
        github.vscode-pull-request-github
      ];
    };
  };
  
  services.gnome-keyring.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty"; 
      startup = [
        # Launch Firefox on start
        {command = "firefox";}
      ];
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
