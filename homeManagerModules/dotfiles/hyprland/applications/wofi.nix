{ pkgs, ... }:
{

  programs.wofi.enable = true;

  programs.wofi.settings = {

    allow_images = true;

    prompt = "Buscar aplicaciones";

  };

}
