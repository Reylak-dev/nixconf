{ pkgs, ... }:
{

  imports = [

    ./kitty.nix
    ./wofi.nix

  ];

  home.packages = with pkgs; [
    brightnessctl
  ];

}
