{ lib, config, pkgs, ... }:
{

  options.gaming.enable = lib.mkEnableOption "enables gaming apps";

  config = lib.mkIf config.gaming.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    programs.gamescope.enable = true;

    programs.gamemode.enable = true;
  };

}
