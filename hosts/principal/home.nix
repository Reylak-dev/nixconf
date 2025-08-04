{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "reylak";
  home.homeDirectory = "/home/reylak";

  home.packages = with pkgs; [

  ];

  desktopApps.enable = true;

  dotfiles.hyprland.enable = true;

  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
