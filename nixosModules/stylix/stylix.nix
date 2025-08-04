{ config, pkgs, ... }:
{

  stylix = {

    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";

    polarity = "dark";

    homeManagerIntegration.autoImport = true;
    homeManagerIntegration.followSystem = true;

    fonts = {
      serif = {

	package = pkgs.nerd-fonts.monoid;
	name = "Monoid Nerd Font";

      };

      monospace = {

	package = pkgs.nerd-fonts.monoid;
	name = "Monoid Nerd Font Mono";

      };

      sizes = {

	applications = 12;
	desktop = 8;
	popups = 14;
	terminal = 10;

      };

    };

    cursor = {

      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-hyprcursors-white";
      size = 24;

    };

    opacity = {

      terminal = 0.8;
      desktop = 0.0;

    };

  };

}
