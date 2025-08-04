{ lib, config, pkgs, ... }:
{

  programs.kitty.enable = true;

  programs.kitty.settings = {

    bold_font = "auto";
    italic_font = "auto";
    bold_italic_font = "auto";

  };

}
