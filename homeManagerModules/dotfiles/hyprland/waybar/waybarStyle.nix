{ lib, pkgs, ... }:
{

  stylix.targets.waybar.enable = true;
  stylix.targets.waybar.addCss = true;

  stylix.targets.waybar = {

    enableLeftBackColors = false;
    enableCenterBackColors = false;
    enableRightBackColors = false;

  };

  programs.waybar.style = lib.mkAfter ''

    * {
      min-height: 0;
    }

    .modules-left * {
      border-radius: 10px;
      border-width: 4px;
      background-color: @base00;
      color: @base05;
      border-color: @base0D;
    }

    .modules-center #workspaces {
      border-radius: 10px;
      border-width: 4px;
      background-color: @base00;
      color: @base05;
      border-color: @base0D;
    }

    .modules-center #workspaces button {
      background-color: rgba(0, 0, 0, 0.0);
    }

    .modules-center #workspaces button.active {
      background-color: @base03;
    }

    .modules-center #workspaces button.urgent {
      background-color: @base09;
    }

    .modules-right * {
      border-radius: 10px;
      border-width: 4px;
      background-color: @base00;
      color: @base05;
      border-color: @base0D;
    }

  '';

}
