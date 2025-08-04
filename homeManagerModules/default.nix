{ ... }:
{
  imports = [
    ./userDirs/userDirs.nix
    ./dotfiles/hyprland/hyprDotfile.nix
    ./stylix/stylix.nix
    ./shell/zshConfig.nix
    ./desktopApps/desktopApps.nix
  ];
}
