{ lib, config, pkgs, ... }:
{

  imports = [

    ./waybarStyle.nix

  ];

  options = {
    waybarConfiguration.enable = lib.mkEnableOption "enables the waybar configuration";
  };

  config = lib.mkIf config.waybarConfiguration.enable {

    programs.waybar.enable = true;
    programs.waybar.settings = {

      mainBar = {

	# Main config
	layer = "top";
	position = "top";
	height = 24;
	spacing = 6;

	# Modules
	modules-left = [ "group/hardware" ];
	modules-center = [ "hyprland/workspaces" ];
	modules-right = [ "group/output" "clock" ];

	# Module's configuration
	"hyprland/workspaces" = {

	  disable-scroll = true;
	  all-outputs = true;

	};

	"group/output" = {

	  orientation = "horizontal";
	  modules = [ "pulseaudio" "backlight" ];

	};

	"pulseaudio" = {

	  format = "{icon} {volume}% {format_source}";
	  format-muted = "M {format_source}";
	  format-source = " {volume}%";
	  format-source-muted = "M {volume}%";
	  format-icons = {
	    headphone = "";
	    headset = "";
	    phone = "";
	    portable = "";
	    car = "";
	    default = [ "" "" "" ];
	  };

	};

	"backlight" = {

	  format = "{percent}% {icon}";
	  format-icons = [ "󰃞" "󰃝" "󰃟" "󰃠" "󰃡" "󰳲" ];

	};

	"clock" = {

	  format = "󰥔 {:%H:%M}";
	  timezone = "America/Argentina/Buenos_Aires";

	};

	"group/hardware" = {

	  orientation = "horizontal";
	  modules = [ "battery" "cpu" "memory" ];

	};

	"cpu" = {

	  format = " {usage}%";

	};

	"memory" = {

	  format = " {percentage}%";

	};

	"battery" = {

	  format = "{icon} {capacity}%";
	  format-icons = [ "" "" "" "" "" ];

	};

      };

    };

  };

}
