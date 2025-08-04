{ lib, config, inputs, pkgs, ... }:
{

  options = {

    host.personalUse = lib.mkEnableOption "prepare the host for personal usage";

  };

  config = lib.mkIf config.host.personalUse {

    # Tmux for multiple tty
    programs.tmux.enable = true;

    # Enable the auto-mount for the external drives
    services.gvfs.enable = true;

    # Enable hyprland with xwayland
    programs.hyprland = {

      enable = true;
      xwayland.enable = true;

    };

    # Enable the mouse on the tty
    services.gpm.enable = true;

    # Enable Htop
    programs.htop.enable = true;

    # Enable thunar file-manager
    programs.thunar.enable = true;

    # Packages to install for a basic CLI and GUI usage
    environment.systemPackages = with pkgs; [
      links2
      browsh
      pfetch
      mpv
      inputs.yt-x.packages."${system}".default
    ];

  };

}
