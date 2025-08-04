# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the Grub boot loader.

  boot.loader.efi = {

    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";

  };

  boot.loader.grub = {

    device = "nodev";
    efiSupport = true;
    useOSProber = true;
    configurationLimit = 10;

  };

  # Set the host for personal usage
  host.personalUse = true;

  # Networking options
  networking.networkmanager.enable = true;
  networking.hostName = "juanaManso"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "America/Argentina/Buenos_Aires";

  # Select internationalisation properties.
   i18n.defaultLocale = "es_AR.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     keyMap = "dvorak-la";
     useXkbConfig = false; # use xkb.options in tty.
   };

  # Enable the X11 windowing system.
  services.xserver.enable = false;
  services.xserver.excludePackages = [ pkgs.xterm ];

  # Configure keymap in X11
  services.xserver.xkb.layout = "latam";
  services.xserver.xkb.variant = "dvorak";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.reylak = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  # Declare home-manager config
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "home-backup";
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users.reylak = {
    
    imports = [

      ./home.nix
      inputs.self.outputs.homeManagerModules.default

    ];

  };

  # Enable gaming apps
  gaming.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
    vim
    wget
  ];

  nixpkgs.config.allowUnfree = true;

  # Display manager
  services.xserver.displayManager.startx.enable = true;

  # Enable nvidia drivers
  nvidiaDrivers.enable = true;

}

