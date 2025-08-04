{ lib, config, pkgs, ... }:
{
  options.desktopApps.enable = lib.mkEnableOption "enables the daily usage apps";

  config = lib.mkIf config.desktopApps.enable {
    programs.librewolf= {
      enable  = true;

      languagePacks = ["en" "es-AR"];

      settings = {
        "privacy.resistFingerPrinting" = false;
      };
    };

    programs.obs-studio = {
      enable = true;
    };

    programs.onlyoffice = {
      enable = true;
    };

    home.packages = with pkgs; [
      discord
      discordo
      telegram-desktop
      bitwarden
      github-desktop
    ];

  };

}
