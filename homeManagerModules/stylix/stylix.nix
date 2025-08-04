{ config, pkgs, ... }:
{

  stylix = {

    enable = true;

    icons = {

      enable = true;

      light = "Nordzy";
      dark = "Nordzy-dark";

      package = pkgs.nordzy-icon-theme;

    };

  };

}
