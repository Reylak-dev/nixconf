{ lib, config, pkgs, ... }:
{

  imports = [

    ./applications/apps.nix
    ./waybar/waybarConfiguration.nix

  ];

  options = {

    dotfiles.hyprland.enable = lib.mkEnableOption "enables the hyprland dotfile";

  };


  config = lib.mkIf config.dotfiles.hyprland.enable {

    waybarConfiguration.enable = true;

    wayland.windowManager.hyprland = {

      enable = true;
      xwayland.enable = true;

      settings = {

	# Start applications
	exec-once = [

	  "waybar" 

	];

	# Modifier key
	"$mod" = "SUPER";

	# Default applications
	"$terminal" = "kitty";
	"$menu" = "wofi --show drun";
	"$fileManager" = "thunar";
	"$browser" = "librewolf";

	bind = [

	  # Applications hotkeys

	  "$mod, RETURN, exec, $terminal"
	  "$mod, m, exec, $menu"
	  "$mod, u, exec, $fileManager"
	  "$mod, l, exec, $browser"

	  # Actions
	  "$mod, q, killactive"
	  "$mod SHIFT, q, exit"
	  "$mod, f, togglefloating"

	  # Switch workspaces
	  "$mod, 1, workspace, 1"
	  "$mod, 2, workspace, 2"
	  "$mod, 3, workspace, 3"
	  "$mod, 4, workspace, 4"
	  "$mod, 5, workspace, 5"
	  "$mod, 6, workspace, 6"
	  "$mod, 7, workspace, 7"
	  "$mod, 8, workspace, 8"
	  "$mod, 9, workspace, 9"
	  "$mod, 0, workspace, 10"

	  # Move focused window to workspace
	  "$mod SHIFT, 1, movetoworkspace, 1"
	  "$mod SHIFT, 2, movetoworkspace, 2"
	  "$mod SHIFT, 3, movetoworkspace, 3"
	  "$mod SHIFT, 4, movetoworkspace, 4"
	  "$mod SHIFT, 5, movetoworkspace, 5"
	  "$mod SHIFT, 6, movetoworkspace, 6"
	  "$mod SHIFT, 7, movetoworkspace, 7"
	  "$mod SHIFT, 8, movetoworkspace, 8"
	  "$mod SHIFT, 9, movetoworkspace, 9"
	  "$mod SHIFT, 0, movetoworkspace, 10"

	];

	bindm = [

	  # Move and resize windows
	  "$mod, mouse:272, movewindow"
	  "$mod, mouse:273, resizewindow"

	];

	bindel = [

	  # Volume and brightness controls
	  ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
	  ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	  ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	  ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
	  ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

	];

	bindl = [

	  # Playerctl controls
	  ", XF86AudioNext, exec, playerctl next"
	  ", XF86AudioPause, exec, playerctl play-pause"
	  ", XF86AudioPlay, exec, playerctl play-pause"
	  ", XF86AudioPrev, exec, playerctl previous"
	  
	];

	decoration = {

	  # Rounded corners
	  rounding = 5;
	  rounding_power = 2;

	  # Window's transparency
	  active_opacity = 1.0;
	  inactive_opacity = 0.3;

	  # Shadows
	  shadow = {

	    enabled = true;
	    range = 8;
	    render_power = 3;

	  };

	  # Thansparency's blur
	  blur = {

	    enabled = true;
	    size = 5;
	    passes = 1;

	  };

	};

	input = {

	  # Keyboard layout
	  kb_layout = "latam, us";
	  kb_variant = "dvorak,";
	  kb_options = grp:win_space_toggle;

	}; 

      };

    };

  };

}
